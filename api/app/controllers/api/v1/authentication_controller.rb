# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApiController
      # POST /api/v1/auth/login
      #
      # The tenant comes from TenantResolverMiddleware (X-Tenant-Scheme header,
      # or the Referer host for the browser app) and require_tenant! rejects the
      # request when none resolves. It must never fall back to "some" organization:
      # admins live in a global users table, so a guessed tenant would hand out a
      # token for another company's candidate data.
      def authenticate
        user = User.find_by(email: params[:email].to_s.downcase)

        return json_error('Invalid email or password', :unauthorized) unless user&.authenticate(params[:password])

        return json_error('Invalid email or password', :unauthorized) unless user.role == 'admin' && user.active?

        token = JsonWebToken.encode({ user_id: user.id, role: user.role, scheme: current_organization.scheme })

        json_response({ token:, user: { id: user.id, email: user.email, role: user.role } })
      end
    end
  end
end
