# Soal 4 — Storage, keamanan, HTTP (25%)

Acuan soal: baris 96–104, 114–130, 226–268 pada modul. Latihan memakai package `http` mengikuti perintah spesifik baris 252 walaupun tidak disebut pada daftar umum dependency.

## Langkah saat responsi

1. Pasang `shared_preferences`, `flutter_secure_storage`, `flutter_dotenv`, **`http`** dengan `flutter pub add ...`.
2. Buat `SecureStorageService`: key `note_content_<id>` untuk simpan/baca/hapus isi.
3. Buat `NoteRepository`: simpan **hanya id, judul, tanggal** sebagai JSON list di SharedPreferences; isi catatan hanya di secure storage. Uji tambah, restart aplikasi, hapus.
4. Salin `.env.example` ke `.env`; pakai `BASE_URL`, `API_KEY` dummy. Masukkan `.env` ke assets Flutter tetapi **abaikan dari Git**. Ingat: `.env` sebagai Flutter asset **bukan tempat aman untuk API key sungguhan**; nilai bisa diekstrak dari aplikasi.
5. HTTP GET `/users` dengan timeout, `SocketException`, penanganan respons/error. Tap ikon globe pada home. Matikan internet emulator untuk SS error, lalu nyalakan lagi.
6. Atur `INTERNET` dan `allowBackup="false"` di AndroidManifest; jangan log isi catatan atau token. Dokumentasi publik `///`.

## Target screenshot

| SS | File/baris VS Code | Yang terlihat |
| --- | --- | --- |
| `04-secure.png` | `lib/services/secure_storage_service.dart` **baris 1–23** | Prefix key dan 3 method simpan/baca/hapus. |
| `04-repository.png` | `lib/repositories/note_repository.dart` **baris 9–56** | Metadata JSON vs isi secure storage; SS kedua bila perlu. |
| `04-env.png` | `lib/config/app_config.dart` **baris 1–12**, `.env.example` **baris 1–2** | Akses konfigurasi dan **nilai dummy saja**. Jangan SS `.env` asli/credential. |
| `04-http.png` | `lib/services/public_api_service.dart` **baris 10–43** | GET, timeout, `SocketException`, status, format data. |
| `04-android.png` | `android/app/src/main/AndroidManifest.xml` **baris 1–9** | Permission `INTERNET`, `allowBackup="false"`. |
| `04-api-layar.png` | Emulator, tanpa nomor baris | ListView nama pengguna API; opsional SS error offline di `04-api-error.png`. |

Catatan keamanan: konten tidak berada pada metadata JSON. `flutter_secure_storage` menggunakan mekanisme platform; pengujian di emulator perlu Android yang mendukung plugin.
