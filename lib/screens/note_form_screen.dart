import 'package:flutter/material.dart';

import '../models/note.dart';
import '../providers/app_provider.dart';
import '../utils/validators.dart';

/// Form tambah catatan dengan validasi input.
class NoteFormScreen extends StatefulWidget {
  /// Membuat form catatan baru.
  const NoteFormScreen({super.key});

  @override
  State<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _saving) return;
    final title = Validators.sanitize(_title.text);
    final content = Validators.sanitize(_content.text);
    if (Validators.validateTitle(title) != null ||
        Validators.validateContent(content) != null) {
      setState(
        () => _error =
            'Teks setelah dibersihkan terlalu pendek. Periksa kembali.',
      );
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final note = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      date: DateTime.now(),
      content: content,
    );
    try {
      await AppProvider.of(context).addNote(note);
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = 'Gagal menyimpan catatan. Coba lagi.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(labelText: 'Judul catatan'),
                maxLength: 50,
                validator: Validators.validateTitle,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _content,
                decoration: const InputDecoration(labelText: 'Isi catatan'),
                maxLines: 6,
                maxLength: 1000,
                validator: Validators.validateContent,
              ),
              if (_error != null)
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _saving ? null : _save,
                child: _saving
                    ? const CircularProgressIndicator()
                    : const Text('Simpan Catatan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
