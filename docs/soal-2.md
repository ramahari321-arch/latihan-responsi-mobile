# Soal 2 — Profil dan widget modular (20%)

Acuan soal: baris 154–184 pada modul.

## Langkah saat responsi

1. Buat `Student` berisi `name`, `nim`, `programStudi`, `email`.
2. Buat `ProfileCard` di widget terpisah: `CircleAvatar` inisial, `Row`, `Column`, `Container`, `EdgeInsets`, tombol Edit Profil.
3. Buat `ProfileScreen`; tombol membuka dialog edit dengan input yang divalidasi, hasil dikirim ke `AppProvider`.
4. Di emulator, tap ikon profil pada AppBar; edit nama dan cek tampilan berubah.

## Target screenshot

| SS | File/baris VS Code | Yang terlihat |
| --- | --- | --- |
| `02-model.png` | `lib/models/student.dart` **baris 1–22** | Empat field model `Student`. |
| `02-widget.png` | `lib/widgets/profile_card.dart` **baris 17–49** | `CircleAvatar`, `Row`, `Column`, `Container`; lanjut baris 49–66 jika tombol tidak muat. |
| `02-edit.png` | `lib/screens/profile_screen.dart` **baris 13–33 dan 66–102** | Dialog edit, validasi, dan `updateStudent`; bisa dua SS kode jika perlu. |
| `02-profil-layar.png` | Emulator, tanpa nomor baris | Avatar inisial, nama, NIM, prodi, email, tombol Edit Profil. |

Profil saat ini hanya state memori; tidak diklaim tersimpan setelah restart.
