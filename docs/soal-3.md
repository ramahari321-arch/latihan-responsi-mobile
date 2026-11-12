# Soal 3 — State management dan form (20%)

Acuan soal: baris 186–224 pada modul.

## Langkah saat responsi

1. Buat `AppProvider extends InheritedWidget`: `Student`, `List<Note>`, callback edit/tambah/hapus; wrapper `StatefulWidget` memanggil `setState` setelah operasi sukses.
2. Buat `Validators`: judul 3–50, isi 10–1000 karakter; buang `<`, `>`, `"`, `'`.
3. Buat `NoteFormScreen` dengan `Form`, `TextFormField`, validasi, sanitasi, dan pesan gagal simpan.
4. Di emulator: tekan `+`, tekan Simpan saat kosong untuk SS error; isi valid lalu simpan.

## Target screenshot

| SS | File/baris VS Code | Yang terlihat |
| --- | --- | --- |
| `03-provider.png` | `lib/providers/app_provider.dart` **baris 8–60** | `InheritedWidget`, data, callback, `of`, `updateShouldNotify`. |
| `03-wrapper.png` | `lib/providers/app_provider.dart` **baris 63–143** | `StatefulWidget`, `setState`, tambah/hapus catatan; ambil dua SS jika tidak muat. |
| `03-validator.png` | `lib/utils/validators.dart` **baris 1–28** | Batas panjang dan sanitasi. |
| `03-form.png` | `lib/screens/note_form_screen.dart` **baris 30–65 dan 66–108** | `_save`, validasi, `TextFormField`; bisa dua SS. |
| `03-error-layar.png` | Emulator, tanpa nomor baris | Pesan “Judul minimal 3 karakter” dan “Isi minimal 10 karakter”. |

Setelah sanitasi, panjang dicek ulang agar teks yang seluruhnya karakter terlarang tidak lolos validasi.
