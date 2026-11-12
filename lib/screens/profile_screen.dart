import 'package:flutter/material.dart';

import '../models/student.dart';
import '../providers/app_provider.dart';
import '../utils/validators.dart';
import '../widgets/profile_card.dart';

/// Halaman profil yang memungkinkan perubahan data mahasiswa.
class ProfileScreen extends StatelessWidget {
  /// Membuat halaman profil.
  const ProfileScreen({super.key});

  Future<void> _editProfile(BuildContext context, Student student) async {
    final formKey = GlobalKey<FormState>();
    final name = TextEditingController(text: student.name);
    final nim = TextEditingController(text: student.nim);
    final programStudi = TextEditingController(text: student.programStudi);
    final email = TextEditingController(text: student.email);
    try {
      final updated = await showDialog<Student>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Edit Profil'),
          content: SizedBox(
            width: 400,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(labelText: 'Nama'),
                      validator: Validators.validateRequired,
                    ),
                    TextFormField(
                      controller: nim,
                      decoration: const InputDecoration(labelText: 'NIM'),
                      validator: Validators.validateRequired,
                    ),
                    TextFormField(
                      controller: programStudi,
                      decoration: const InputDecoration(
                        labelText: 'Program studi',
                      ),
                      validator: Validators.validateRequired,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (Validators.validateRequired(value) != null) {
                          return 'Wajib diisi';
                        }
                        return RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                                .hasMatch(value!.trim())
                            ? null
                            : 'Email tidak valid';
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                Navigator.pop(
                  dialogContext,
                  Student(
                    name: Validators.sanitize(name.text),
                    nim: Validators.sanitize(nim.text),
                    programStudi: Validators.sanitize(programStudi.text),
                    email: Validators.sanitize(email.text),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      );
      if (updated != null && context.mounted) {
        AppProvider.of(context).updateStudent(updated);
      }
    } finally {
      name.dispose();
      nim.dispose();
      programStudi.dispose();
      email.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final student = AppProvider.of(context).student;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ProfileCard(
          student: student,
          onEdit: () => _editProfile(context, student),
        ),
      ),
    );
  }
}
