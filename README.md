# Soal 3 — State management dan validasi form (20%)

Branch `soal-3` memuat provider, model catatan, validator, dan form. **Aplikasi utuh baru tersedia di [`main`](https://github.com/ramahari321-arch/latihan-responsi-mobile/tree/main)**; pindah ke `main` untuk SS emulator. [Detail soal 3](docs/soal-3.md). Acuan modul: baris 186–224.

## Langkah besok

1. Buat `AppProvider extends InheritedWidget` dengan `Student student`, `List<Note> notes`, `updateStudent`, `addNote`, `deleteNote`.
2. Buat `AppProviderWrapper extends StatefulWidget` untuk memegang state. Gunakan `setState` setelah operasi berhasil; hanya ubah state yang perlu.
3. Buat `Validators`: judul **3–50** karakter, isi **10–1000** karakter, sanitasi `<`, `>`, `"`, `'`.
4. Buat `NoteFormScreen` berisi `Form` dan `TextFormField`. Validasi ulang teks setelah sanitasi, tampilkan error saat simpan gagal.
5. Pada aplikasi lengkap, tekan FAB `+`, tekan Simpan ketika field kosong untuk memunculkan error; isi valid lalu simpan.

## SS yang perlu diambil

| Nama SS | File dan baris di VS Code | Yang harus terlihat |
| --- | --- | --- |
| `03-provider.png` | `lib/providers/app_provider.dart` **baris 8–60** | `InheritedWidget`, data, callback, `of`, `updateShouldNotify`. Jika tak muat, pecah dua SS. |
| `03-wrapper-1.png` | `lib/providers/app_provider.dart` **baris 63–112** | `StatefulWidget`, state, `setState` dan pemuatan. |
| `03-wrapper-2.png` | `lib/providers/app_provider.dart` **baris 113–143** | Tambah/hapus catatan dan pembaruan mahasiswa. |
| `03-validator.png` | `lib/utils/validators.dart` **baris 1–28** | Rentang panjang dan sanitasi. |
| `03-form-1.png` | `lib/screens/note_form_screen.dart` **baris 30–65** | `_save`, validasi, sanitasi, hasil `Navigator.pop(context, true)`. |
| `03-form-2.png` | `lib/screens/note_form_screen.dart` **baris 66–108** | Field judul/isi dan pesan error. |
| `03-error-layar.png` | **Emulator pada `main`**, tanpa nomor baris | Pesan “Judul minimal 3 karakter” dan “Isi minimal 10 karakter”. |

Nomor baris mengacu snapshot latihan. Jika file berubah, cari class atau method di tabel. Di VS Code aktifkan `View > Appearance > Show Line Numbers`, tekan `Ctrl+G` untuk menuju baris. Tampilkan tab nama file dalam SS kode.
