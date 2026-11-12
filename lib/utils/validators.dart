/// Validasi dan sanitasi input pengguna.
class Validators {
  Validators._();

  /// Judul wajib 3–50 karakter.
  static String? validateTitle(String? value) {
    final text = value?.trim() ?? '';
    if (text.length < 3) return 'Judul minimal 3 karakter';
    if (text.length > 50) return 'Judul maksimal 50 karakter';
    return null;
  }

  /// Isi wajib 10–1000 karakter.
  static String? validateContent(String? value) {
    final text = value?.trim() ?? '';
    if (text.length < 10) return 'Isi minimal 10 karakter';
    if (text.length > 1000) return 'Isi maksimal 1000 karakter';
    return null;
  }

  /// Menolak teks kosong pada field profil.
  static String? validateRequired(String? value) =>
      (value?.trim().isEmpty ?? true) ? 'Wajib diisi' : null;

  /// Membersihkan karakter yang tidak diizinkan oleh soal.
  static String sanitize(String input) =>
      input.trim().replaceAll(RegExp('[<>"\x27]'), '');
}
