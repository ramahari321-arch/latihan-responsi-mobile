import 'package:flutter/material.dart';

import '../models/student.dart';

/// Kartu informasi profil tanpa logika penyimpanan.
class ProfileCard extends StatelessWidget {
  /// Membuat kartu profil dengan aksi edit.
  const ProfileCard({super.key, required this.student, required this.onEdit});

  /// Data profil yang ditampilkan.
  final Student student;

  /// Aksi tombol edit.
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final initials = student.name.trim().isEmpty
        ? '?'
        : student.name
              .trim()
              .split(RegExp(r'\s+'))
              .take(2)
              .map((e) => e[0])
              .join()
              .toUpperCase();
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 30, child: Text(initials)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(student.nim),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Program studi: ${student.programStudi}'),
            Text('Email: ${student.email}'),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onEdit,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
