import 'package:flutter/material.dart';

import '../models/note.dart';
import '../providers/app_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/note_card.dart';
import 'note_form_screen.dart';
import 'profile_screen.dart';
import 'public_users_screen.dart';

/// Halaman utama profil singkat dan daftar catatan.
class HomeScreen extends StatelessWidget {
  /// Membuat halaman utama.
  const HomeScreen({super.key});

  Future<void> _confirmDelete(BuildContext context, Note note) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus catatan?'),
        content: Text(
          'Hapus "${note.title}"? Tindakan ini tidak bisa dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    try {
      await AppProvider.of(context).deleteNote(note.id);
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal menghapus catatan.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = AppProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Kuliah'),
        actions: [
          IconButton(
            tooltip: 'Pengguna publik',
            icon: const Icon(Icons.public),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const PublicUsersScreen(),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Profil',
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const ProfileScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${app.student.name} · ${app.student.nim}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: app.isLoading
                ? const Center(child: CircularProgressIndicator())
                : app.error != null
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(app.error!),
                        TextButton(
                          onPressed: app.reloadNotes,
                          child: const Text('Coba lagi'),
                        ),
                      ],
                    ),
                  )
                : app.notes.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    itemCount: app.notes.length,
                    itemBuilder: (context, index) {
                      final note = app.notes[index];
                      return NoteCard(
                        note: note,
                        onDelete: () => _confirmDelete(context, note),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah catatan',
        onPressed: () async {
          final saved = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const NoteFormScreen()),
          );
          if (saved == true && context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Catatan tersimpan.')));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
