# Soal 4 — Penyimpanan lokal, keamanan, HTTP (25%)

Branch `soal-4` berisi repository, secure storage, konfigurasi, dan kode HTTP. Untuk screenshot **aplikasi berjalan**, gunakan [branch `main`](https://github.com/ramahari321-arch/latihan-responsi-mobile/tree/main); integrasi home ada di soal 5. [Detail soal 4](docs/soal-4.md). Acuan modul: baris 226–268.

## Langkah besok

1. Pasang `shared_preferences`, `flutter_secure_storage`, `flutter_dotenv`, `http`; modul spesifik meminta package **`http`** meski daftar dependency umum tidak menyebutnya.
2. `SecureStorageService`: simpan/baca/hapus isi catatan memakai key `note_content_<id>`.
3. `NoteRepository`: JSON list `id`, `title`, `date` saja di SharedPreferences; **content hanya di secure storage**. Uji tambah, tutup-buka aplikasi, lalu hapus.
4. Salin `.env.example` ke `.env` (`Copy-Item .env.example .env` di PowerShell). `BASE_URL` dipakai GET `/users`; `API_KEY` contoh hanya dummy. **Jangan commit `.env` atau tampilkan nilai kunci asli di SS.** Flutter asset `.env` bukan tempat aman untuk credential produksi.
5. GET `/users`: timeout, respons bukan 200, `SocketException`, error format, pesan aman dan tombol coba lagi. Di AndroidManifest set `INTERNET` dan `allowBackup="false"`. Jangan log isi catatan/token.

## SS yang perlu diambil

| Nama SS | File dan baris di VS Code | Yang harus terlihat |
| --- | --- | --- |
| `04-secure.png` | `lib/services/secure_storage_service.dart` **baris 1–23** | Key `note_content_` dan method simpan/baca/hapus. |
| `04-repository-1.png` | `lib/repositories/note_repository.dart` **baris 9–32** | Baca metadata JSON dan isi secure storage. |
| `04-repository-2.png` | `lib/repositories/note_repository.dart` **baris 33–56** | Simpan/hapus metadata dan konten terpisah. |
| `04-konfigurasi.png` | `lib/config/app_config.dart` **baris 1–12**; `.env.example` **baris 1–2** | Config dan nilai **dummy**, bukan `.env` asli. |
| `04-http.png` | `lib/services/public_api_service.dart` **baris 10–43** | GET, timeout, `SocketException`, status; pecah dua SS bila perlu. |
| `04-manifest.png` | `android/app/src/main/AndroidManifest.xml` **baris 1–9** | INTERNET dan `allowBackup="false"`. |
| `04-api-layar.png` | **Emulator pada `main`**, tanpa nomor baris | ListView pengguna; tambahan `04-api-error.png` saat internet mati. |

Nomor baris berlaku untuk snapshot branch ini. Di VS Code aktifkan nomor baris dan tekan `Ctrl+G`; setelah edit, cari nama method karena baris dapat bergeser. SS kode dan SS emulator beda bukti.
