import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/note.dart';
import '../services/secure_storage_service.dart';

/// Memisahkan metadata catatan dari isi yang sensitif.
class NoteRepository {
  /// Membuat repository catatan.
  NoteRepository({SecureStorageService? secureStorage})
    : _secureStorage = secureStorage ?? const SecureStorageService();

  static const _metadataKey = 'note_metadata';
  final SecureStorageService _secureStorage;

  /// Memuat daftar catatan dari kedua jenis penyimpanan.
  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString(_metadataKey);
    if (encoded == null) return [];
    final metadata = jsonDecode(encoded) as List<dynamic>;
    final notes = <Note>[];
    for (final item in metadata) {
      final data = Map<String, dynamic>.from(item as Map);
      final content = await _secureStorage.getContent(data['id'] as String);
      notes.add(Note.fromMetadataJson(data, content ?? ''));
    }
    return notes;
  }

  /// Menyimpan isi dahulu, lalu menambah metadata; membatalkan isi jika gagal.
  Future<void> addNote(Note note) async {
    await _secureStorage.saveContent(note.id, note.content);
    try {
      final prefs = await SharedPreferences.getInstance();
      final metadata = _readMetadata(prefs)..add(note.toMetadataJson());
      if (!await prefs.setString(_metadataKey, jsonEncode(metadata))) {
        throw StateError('Gagal menyimpan metadata catatan');
      }
    } catch (_) {
      await _secureStorage.deleteContent(note.id);
      rethrow;
    }
  }

  /// Menghapus metadata dahulu, lalu isi; pemanggilan ulang aman jika isi tersisa.
  Future<void> deleteNote(String noteId) async {
    final prefs = await SharedPreferences.getInstance();
    final metadata = _readMetadata(prefs)
      ..removeWhere((item) => item['id'] == noteId);
    if (!await prefs.setString(_metadataKey, jsonEncode(metadata))) {
      throw StateError('Gagal menghapus metadata catatan');
    }
    await _secureStorage.deleteContent(noteId);
  }

  List<Map<String, dynamic>> _readMetadata(SharedPreferences prefs) {
    final encoded = prefs.getString(_metadataKey);
    if (encoded == null) return [];
    return (jsonDecode(encoded) as List<dynamic>)
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();
  }
}
