# Latihan Responsi Mobile — Profil Mahasiswa & Catatan Kuliah

Proyek latihan berdasarkan `Latihan-Soal-ResponsiMobile.md`. Kode Flutter berada di folder ini. Remote latihan: https://github.com/ramahari321-arch/latihan-responsi-mobile.

## Jalankan di lab

1. Buka **folder proyek ini**, bukan folder template `responsi_pemrograman_mobile_nim`, di VS Code.
2. Jalankan `flutter pub get`.
3. Salin `.env.example` menjadi `.env` di akar proyek. Contoh PowerShell: `Copy-Item .env.example .env`. Jangan commit `.env`. Nilai `API_KEY` di contoh hanya dummy; API publik `/users` tidak memerlukannya.
4. Siapkan emulator Android, lalu `flutter run`. Jika menambah/mengubah `.env`, lakukan **restart penuh**, bukan hot reload.
5. Periksa `flutter analyze` dan `flutter test` sebelum mengumpulkan.

## Panduan tiap soal dan SS

| Soal | Branch | Panduan | Fokus |
| --- | --- | --- | --- |
| 1 | `soal-1` | [docs/soal-1.md](docs/soal-1.md) | struktur, Git |
| 2 | `soal-2` | [docs/soal-2.md](docs/soal-2.md) | profil, widget modular |
| 3 | `soal-3` | [docs/soal-3.md](docs/soal-3.md) | provider, validasi |
| 4 | `soal-4` | [docs/soal-4.md](docs/soal-4.md) | storage, keamanan, HTTP |
| 5 | `soal-5` | [docs/soal-5.md](docs/soal-5.md) | integrasi, navigasi, laporan |

Nomor baris pada dokumen berlaku untuk **versi kode latihan ini**. Di VS Code: `View > Appearance > Show Line Numbers` jika belum tampil. Buka file sesuai tabel, tekan `Ctrl+G` untuk menuju baris awal, atur zoom agar rentang baris dan nama file terlihat. Jika kode diedit, cari nama class/method yang disebut; nomor baris dapat bergeser. **SS kode bukan pengganti SS layar emulator.**

## Alur aplikasi

`UI → AppProvider/Wrapper → NoteRepository → SharedPreferences (id, judul, tanggal) + flutter_secure_storage (isi)`.

Profil dapat diedit selama aplikasi berjalan; **profil tidak disimpan permanen** karena soal hanya mewajibkan penyimpanan catatan. Konten catatan tampil pada UI, tetapi tidak dicetak ke log. Sanitasi karakter `<`, `>`, `"`, `'` mengikuti spesifikasi latihan; bukan pengganti proteksi XSS untuk konteks web.

## Checklist sebelum responsi

- [ ] Profil dan form tambah catatan tampil di emulator.
- [ ] Judul kurang 3 karakter dan isi kurang 10 karakter menunjukkan error.
- [ ] Catatan tetap ada setelah aplikasi ditutup lalu dibuka; penghapusan meminta konfirmasi.
- [ ] Halaman ikon globe memuat `/users`; saat offline tampil error dan tombol coba lagi.
- [ ] `git log --graph --oneline --all` menampilkan minimal 5 commit, 2 branch fitur, dan merge ke `main`.
- [ ] Semua branch soal tetap ada setelah merge; `.env` tidak ikut push.
- [ ] PDF maksimal 3 halaman berisi identitas, deskripsi, diagram arsitektur, bukti Sub-CPMK 1–4, SS aplikasi, kendala/solusi, dan link repo.

Laporan asli: `Responsi_PemrogramanMobile_NIM_Nama.pdf`. Unggah sebelum akhir sesi 100 menit. Nama repo responsi asli menurut modul: `responsi-pemrograman-mobile-NIM`; repo ini khusus latihan.
