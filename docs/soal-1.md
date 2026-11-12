# Soal 1 — Struktur proyek dan Git (15%)

Acuan soal: baris 59–94 dan 132–152 pada modul. Branch ini jadi checkpoint struktur awal; penyempurnaan dokumentasi muncul pada branch berikutnya.

## Langkah saat responsi

1. `flutter create responsi_profil_mahasiswa`; cek `flutter doctor` bila emulator gagal.
2. Buat folder `config`, `models`, `repositories`, `providers`, `screens`, `services`, `utils`, `widgets` di `lib/` sesuai modul.
3. Tambahkan `.env`, `build/`, `.dart_tool/` ke `.gitignore`; sediakan `.env.example` berisi nilai dummy.
4. Inisialisasi Git. Buat minimal 5 commit **deskriptif** sepanjang pekerjaan. Buat minimal 2 branch fitur, merge ke `main` tanpa menghapus branch.
5. Di akhir, jalankan `git log --graph --oneline --all` dan `git branch -a`; ambil SS terminal.

## Target screenshot

| SS | File/baris untuk VS Code | Yang terlihat |
| --- | --- | --- |
| `01-struktur.png` | Explorer VS Code, buka `lib/` | Semua folder dan file struktur soal; nomor baris tidak berlaku untuk Explorer. |
| `01-gitignore.png` | `.gitignore`, cari `.env` dan baris `.dart_tool/`, `/build/` | Pola pengabaian; SS bagian berbeda jika tidak muat satu layar. |
| `01-git-log.png` | Terminal, **setelah semua merge** | Output `git log --graph --oneline --all`, branch `soal-*` dan `main`; nomor baris kode tidak berlaku. |

**Penting:** branch `soal-1` dibuat saat awal; SS log diambil setelah soal 5 selesai agar grafik lengkap. Jangan pakai `git branch -d` atau `git push --delete`.
