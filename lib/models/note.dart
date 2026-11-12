/// Catatan yang isi teksnya tidak disimpan bersama metadata.
class Note {
  /// Membuat catatan dari data pengguna.
  const Note({
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  });

  /// Identitas catatan.
  final String id;

  /// Judul catatan.
  final String title;

  /// Tanggal pembuatan catatan.
  final DateTime date;

  /// Isi catatan, disimpan hanya di secure storage.
  final String content;

  /// Mengubah metadata menjadi JSON tanpa menyertakan isi.
  Map<String, dynamic> toMetadataJson() => {
    'id': id,
    'title': title,
    'date': date.toIso8601String(),
  };

  /// Membaca metadata dan memasangkan isi dari secure storage.
  factory Note.fromMetadataJson(Map<String, dynamic> json, String content) {
    return Note(
      id: json['id'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      content: content,
    );
  }
}
