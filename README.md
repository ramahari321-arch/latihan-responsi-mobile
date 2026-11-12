# Soal 1 — Instalasi, struktur proyek, Git (15%)

Branch `soal-1` = **checkpoint awal**, bukan aplikasi lengkap. Buka [panduan lengkap aplikasi di `main`](https://github.com/ramahari321-arch/latihan-responsi-mobile/tree/main) untuk menjalankan hasil akhir. [Detail soal 1](docs/soal-1.md). Acuan modul: baris 59–94 dan 132–152.

## Langkah besok

1. Buat proyek `flutter create responsi_profil_mahasiswa`; buka folder proyek di VS Code.
2. Buat struktur `lib/config`, `models`, `repositories`, `providers`, `screens`, `services`, `utils`, `widgets`. File fitur muncul bertahap di branch berikutnya dan lengkap di `main`.
3. Pastikan `.gitignore` mengabaikan `.env`, `.dart_tool/`, `/build/`; gunakan `.env.example` untuk nilai dummy.
4. Kerjakan minimal **5 commit deskriptif** di minimal **2 branch fitur**, lalu merge ke `main` tanpa menghapus branch. Ambil bukti log **setelah semua merge**.

## SS yang perlu diambil

| Nama SS | Buka di VS Code / terminal | Yang harus terlihat |
| --- | --- | --- |
| `01-struktur.png` | Explorer VS Code pada branch **`main`**, buka `lib/` | Struktur lengkap sesuai soal; Explorer tidak punya nomor baris. |
| `01-gitignore.png` | `.gitignore`: **baris 29–34** (`.dart_tool/`, `/build/`), lalu cari **`.env`** di akhir file | Dua SS jika tidak muat satu layar. Baris `.env` dapat bergeser. |
| `01-git-log.png` | Terminal: `git log --graph --oneline --all` **setelah semua merge** | Minimal 5 commit, branch `soal-1`–`soal-5`, dan merge ke `main`; bukan SS kode. |

Nomor baris sesuai snapshot latihan. Jika kode berubah, cari nama file/pola, bukan mengandalkan baris lama. Di VS Code nyalakan `View > Appearance > Show Line Numbers`; `Ctrl+G` untuk lompat ke baris. **Jangan hapus branch seusai merge.**
