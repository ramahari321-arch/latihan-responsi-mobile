import 'package:flutter/material.dart';

/// Petunjuk ketika belum ada catatan kuliah.
class EmptyState extends StatelessWidget {
  /// Membuat tampilan daftar kosong.
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.note_add_outlined, size: 64),
        SizedBox(height: 12),
        Text('Belum ada catatan. Tekan + untuk menambah.'),
      ],
    ),
  );
}
