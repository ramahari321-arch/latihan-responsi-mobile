# Latihan Responsi Mobile — Profil Mahasiswa & Catatan Kuliah

Proyek latihan berdasarkan `Latihan-Soal-ResponsiMobile.md`. Kode Flutter berada di folder ini. Remote latihan: https://github.com/ramahari321-arch/latihan-responsi-mobile.

## Soal 5 — Integrasi UI, navigasi, dokumentasi (20%)

Branch `soal-5` = aplikasi lengkap sebelum merge akhir. Acuan modul: baris 270–320. [Detail soal 5](docs/soal-5.md).

1. Hubungkan `HomeScreen` dengan `AppProvider`: profil singkat, `ListView.builder`, `NoteCard`, `EmptyState`, FAB tambah.
2. Buat dialog konfirmasi sebelum hapus; navigasi ke profil/form. Form mengembalikan `true` lewat `Navigator.pop`, home membacanya lewat `Navigator.push<bool>`.
3. Tetapkan `ThemeData` di `main.dart`; siapkan loading, empty, error dan tombol coba lagi.
4. Uji home kosong, form invalid, tambah valid, buka ulang, lalu dialog hapus. Tulis PDF **maksimal 3 halaman** berisi identitas, fitur, diagram `UI → Provider → Repository → Storage`, bukti tiap Sub-CPMK, SS, kendala/solusi, link repo.

| Nama SS | File dan baris di VS Code | Yang harus terlihat |
| --- | --- | --- |
| `05-home-1.png` | `lib/screens/home_screen.dart` **baris 48–84** | AppBar, navigasi profil/API, profil singkat. |
| `05-home-2.png` | `lib/screens/home_screen.dart` **baris 85–132** | Loading/error/empty, `ListView.builder`, FAB, nilai kembali dari form. |
| `05-hapus.png` | `lib/screens/home_screen.dart` **baris 16–46** | Dialog konfirmasi dan penghapusan. |
| `05-widget.png` | `lib/widgets/note_card.dart` **baris 1–35**; `lib/widgets/empty_state.dart` **baris 1–19** | Widget kartu dan tampilan kosong. |
| `05-tema.png` | `lib/main.dart` **baris 8–33** | Load `.env`, wrapper provider, tema dan home. |
| `05-kosong-layar.png` / `05-isi-layar.png` / `05-dialog-layar.png` | Emulator; **bukan baris kode** | Home kosong, daftar catatan, dialog hapus. |
| `05-git-log.png` | Terminal: `git log --graph --oneline --all` **sesudah merge ke `main`** | Minimal 5 commit, branch fitur, riwayat merge. |

Nomor baris sesuai snapshot ini. Jika kode berubah, cari nama class/method yang disebut. Aktifkan nomor baris VS Code (`View > Appearance > Show Line Numbers`), pakai `Ctrl+G` untuk ke baris awal, sertakan nama file dalam SS kode.

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
