# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::Authentication", type: :request do
  let(:organization) { create(:organization) }
  let(:tenant_header) { { "X-Tenant-Scheme" => organization.scheme } }
  let!(:admin) { create(:user, email: "admin@example.com", password: "password123", role: "admin") }

  def login(email, password)
    post "/api/v1/auth/login", params: { email: email, password: password }, headers: tenant_header
  end

  it "returns a token for valid admin credentials" do
    login("admin@example.com", "password123")

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)["token"]).to be_present
  end

  it "is case-insensitive on email" do
    login("ADMIN@example.com", "password123")

    expect(response).to have_http_status(:ok)
  end

  it "rejects a wrong password with a generic message" do
    login("admin@example.com", "wrong")

    expect(response).to have_http_status(:unauthorized)
    expect(response.body).not_to include("password123")
  end

  it "gives the same response for an unknown email (no account enumeration)" do
    login("admin@example.com", "wrong")
    known = response.body
    login("ghost@example.com", "wrong")

    expect(response).to have_http_status(:unauthorized)
    expect(response.body).to eq(known)
  end

  it "rejects a non-admin user" do
    create(:user, email: "viewer@example.com", password: "password123", role: "user")

    login("viewer@example.com", "password123")

    expect(response).to have_http_status(:unauthorized)
  end

  it "rejects a deactivated admin at login, not only on later requests" do
    admin.update!(active: false)

    login("admin@example.com", "password123")

    expect(response).to have_http_status(:unauthorized)
  end

  it "does not blow up on missing params" do
    post "/api/v1/auth/login", headers: tenant_header

    expect(response).to have_http_status(:unauthorized)
  end
end
