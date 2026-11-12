import 'package:flutter/material.dart';

import '../models/note.dart';

/// Kartu ringkasan catatan dan aksi hapus.
class NoteCard extends StatelessWidget {
  /// Membuat kartu catatan.
  const NoteCard({super.key, required this.note, required this.onDelete});

  /// Catatan untuk ditampilkan.
  final Note note;

  /// Aksi meminta penghapusan.
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final date = note.date.toLocal();
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(
          '${date.day}/${date.month}/${date.year} · ${note.content}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          tooltip: 'Hapus catatan',
          onPressed: onDelete,
        ),
      ),
    );
  }
}
