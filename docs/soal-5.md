# Soal 5 — Integrasi, navigasi, laporan (20%)

Acuan soal: baris 270–320 dan contoh laporan baris 322–347 pada modul.

## Langkah saat responsi

1. Hubungkan `HomeScreen` ke `AppProvider`: profil singkat, `ListView.builder`, `NoteCard`, `EmptyState`, FAB.
2. Tambahkan dialog konfirmasi hapus. `Navigator.push<bool>` ke form dan `Navigator.pop(context, true)` setelah simpan; tombol profil di AppBar.
3. Pakai `ThemeData` terpusat di `main.dart`; tunjukkan loading, empty, error.
4. Jalankan alur: home kosong → tambah invalid → tambah valid → buka ulang aplikasi → hapus setelah konfirmasi. Cek profil dan API.
5. Buat PDF **maksimal 3 halaman**: identitas, deskripsi aplikasi, diagram `UI → Provider → Repository → Storage`, bukti Sub-CPMK 1–4, SS aplikasi, kendala/solusi, link repo. Nama `Responsi_PemrogramanMobile_NIM_Nama.pdf`; unggah ke LMS akhir sesi.

## Target screenshot

| SS | File/baris VS Code | Yang terlihat |
| --- | --- | --- |
| `05-home-kode.png` | `lib/screens/home_screen.dart` **baris 48–132** | Profil singkat, loading/error/empty, `ListView.builder`, FAB, return value; pecah jadi dua SS. |
| `05-hapus-kode.png` | `lib/screens/home_screen.dart` **baris 16–46** | Dialog, hasil konfirmasi, hapus aman. |
| `05-widget-kode.png` | `lib/widgets/note_card.dart` **baris 1–35** dan `lib/widgets/empty_state.dart` **baris 1–19** | Widget modular. |
| `05-tema-kode.png` | `lib/main.dart` **baris 8–33** | `.env` dimuat, wrapper, tema pusat dan home. |
| `05-kosong-layar.png` | Emulator, tanpa nomor baris | Profil singkat dan empty state. |
| `05-isi-layar.png` | Emulator, tanpa nomor baris | Daftar catatan sesudah simpan. |
| `05-dialog-layar.png` | Emulator, tanpa nomor baris | Dialog konfirmasi sebelum hapus. |
| `05-log.png` | Terminal, tanpa nomor baris | `git log --graph --oneline --all` setelah semua merge. |

Simpan SS ke folder pribadi untuk laporan. Nomor baris di tabel berlaku pada versi latihan ini; setelah mengubah kode, cari method terkait dan perbarui nomor SS.
