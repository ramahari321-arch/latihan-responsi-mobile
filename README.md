# Soal 2 — Widget modular dan profil mahasiswa (20%)

Branch `soal-2` menyimpan **kode profil**, tetapi belum merangkai aplikasi lengkap. Untuk melihat layar profil di emulator, gunakan [branch `main`](https://github.com/ramahari321-arch/latihan-responsi-mobile/tree/main). [Detail soal 2](docs/soal-2.md). Acuan modul: baris 154–184.

## Langkah besok

1. Buat `lib/models/student.dart`: `name`, `nim`, `programStudi`, `email`.
2. Pisahkan tampilan menjadi `lib/widgets/profile_card.dart`: avatar inisial dengan `CircleAvatar`, layout `Row`, `Column`, `Container`, `EdgeInsets`, tombol **Edit Profil**.
3. Buat `lib/screens/profile_screen.dart`: dialog untuk mengubah data; validasi input, lalu panggil `updateStudent` dari provider.
4. Di aplikasi lengkap (`main`), buka ikon profil di AppBar, edit nama, cek profil singkat di home berubah. Profil latihan tersimpan dalam memori selama aplikasi berjalan, **belum permanen**.

## SS yang perlu diambil

| Nama SS | File dan baris di VS Code | Yang harus terlihat |
| --- | --- | --- |
| `02-model.png` | `lib/models/student.dart` **baris 1–22** | Empat field model `Student`. |
| `02-widget-1.png` | `lib/widgets/profile_card.dart` **baris 17–49** | `Container`, `Row`, `CircleAvatar`, `Column` dan inisial. |
| `02-widget-2.png` | `lib/widgets/profile_card.dart` **baris 49–66** | Prodi, email, tombol Edit Profil. |
| `02-edit-1.png` | `lib/screens/profile_screen.dart` **baris 13–33** | Dialog `Edit Profil`, form. |
| `02-edit-2.png` | `lib/screens/profile_screen.dart` **baris 66–102** | Simpan, sanitasi, `updateStudent`. |
| `02-profil-layar.png` | **Emulator pada `main`**; tidak ada nomor baris | Avatar inisial, nama, NIM, prodi, email, tombol Edit Profil. |

Nomor baris berlaku untuk snapshot branch ini. Kalau kode diubah, cari nama class/method; baris dapat bergeser. Di VS Code aktifkan nomor baris lalu `Ctrl+G`; sertakan nama file dan nomor baris saat SS kode. SS emulator terpisah dari SS kode.
