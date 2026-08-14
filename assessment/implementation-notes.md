# Catatan Implementasi (Step 5)

Log kerja pas eksekusi tiap sub-PR di [revamp-strategy.md](revamp-strategy.md).
Diisi berjalan pas ngoding, bukan direkonstruksi belakangan — biar detail AI
verification & bukti test gak ke-lupa pas nyusun PDF final.

---

## Sub-PR 1: Tenant Isolation Hardening

- [ ] Migration ditulis + di-test reversible (`rails db:rollback`)
- [ ] Kode fix
- [ ] Test ditulis, dijalanin, ijo
- [ ] Seeded fault test: rusak logic di branch scratch, buktiin test merah, revert, history kesimpen
- [ ] Screenshot/buk

### AI Verification Moment
<!-- momen AI generate kode salah/riskan + gimana lo koreksi -->

### Catatan lain


---

## Sub-PR 2: Not-Assessed Skill State

- [ ] Migration
- [ ] Kode fix (backend + frontend)
- [ ] Test
- [ ] Seeded fault test
- [ ] Screenshot

### AI Verification Moment

### Catatan lain

---

## Sub-PR 3: Candidate-Facing Error State

- [ ] Kode fix (frontend)
- [ ] Test
- [ ] Seeded fault test
- [ ] Screenshot

### AI Verification Moment

### Catatan lain

---

## Sub-PR 4: Hardware Check Reliability

- [ ] Endpoint baru di api/
- [ ] Kode fix (frontend + backend)
- [ ] Test
- [ ] Seeded fault test
- [ ] Screenshot

### AI Verification Moment

### Catatan lain

---

## Test Coverage — Ringkasan Akhir

<!-- diisi pas semua sub-PR kelar: command yang dijalanin, hasil, coverage kalau ada -->

## Claimed Engineering Depth

<!-- backend-heavy vs frontend-heavy, jujur porsi mana yang paling dalam digarap -->
