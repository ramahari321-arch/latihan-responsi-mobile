import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Menyimpan isi catatan memakai secure storage perangkat.
class SecureStorageService {
  /// Membuat layanan secure storage.
  const SecureStorageService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  String _key(String noteId) => 'note_content_$noteId';

  /// Menyimpan isi catatan secara terenkripsi oleh platform.
  Future<void> saveContent(String noteId, String content) =>
      _storage.write(key: _key(noteId), value: content);

  /// Membaca isi catatan berdasarkan ID.
  Future<String?> getContent(String noteId) => _storage.read(key: _key(noteId));

  /// Menghapus isi catatan berdasarkan ID.
  Future<void> deleteContent(String noteId) =>
      _storage.delete(key: _key(noteId));
}
