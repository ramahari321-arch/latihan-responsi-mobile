import 'package:flutter/material.dart';

import '../models/note.dart';
import '../models/student.dart';
import '../repositories/note_repository.dart';

/// Menyediakan profil, daftar catatan, dan operasi yang diizinkan ke subtree.
class AppProvider extends InheritedWidget {
  /// Membuat provider dengan state dan callback dari wrapper.
  const AppProvider({
    super.key,
    required this.student,
    required this.notes,
    required this.isLoading,
    required this.error,
    required this.updateStudent,
    required this.addNote,
    required this.deleteNote,
    required this.reloadNotes,
    required super.child,
  });

  /// Profil mahasiswa saat ini.
  final Student student;

  /// Catatan yang sudah dimuat.
  final List<Note> notes;

  /// Status pemuatan dari penyimpanan.
  final bool isLoading;

  /// Pesan kesalahan pemuatan bila ada.
  final String? error;

  /// Memperbarui profil.
  final void Function(Student) updateStudent;

  /// Menyimpan catatan lalu memperbarui daftar.
  final Future<void> Function(Note) addNote;

  /// Menghapus catatan lalu memperbarui daftar.
  final Future<void> Function(String) deleteNote;

  /// Memuat ulang daftar catatan.
  final Future<void> Function() reloadNotes;

  /// Mengambil state aplikasi dari konteks widget.
  static AppProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppProvider>();
    assert(provider != null, 'AppProviderWrapper wajib membungkus aplikasi');
    return provider!;
  }

  @override
  bool updateShouldNotify(AppProvider oldWidget) =>
      student != oldWidget.student ||
      notes != oldWidget.notes ||
      isLoading != oldWidget.isLoading ||
      error != oldWidget.error;
}

/// Memiliki state aplikasi dan melakukan perubahan dengan setState.
class AppProviderWrapper extends StatefulWidget {
  /// Membungkus seluruh layar yang mengakses AppProvider.
  const AppProviderWrapper({super.key, required this.child});

  /// Subtree aplikasi.
  final Widget child;

  @override
  State<AppProviderWrapper> createState() => _AppProviderWrapperState();
}

class _AppProviderWrapperState extends State<AppProviderWrapper> {
  final NoteRepository _repository = NoteRepository();
  Student _student = const Student(
    name: 'Nama Mahasiswa',
    nim: 'NIM',
    programStudi: 'Informatika',
    email: 'mahasiswa@example.com',
  );
  List<Note> _notes = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _reloadNotes();
  }

  Future<void> _reloadNotes() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final notes = await _repository.loadNotes();
      if (!mounted) return;
      setState(() {
        _notes = notes;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Gagal memuat catatan. Coba lagi.';
        _isLoading = false;
      });
    }
  }

  Future<void> _addNote(Note note) async {
    await _repository.addNote(note);
    if (!mounted) return;
    setState(() => _notes = [..._notes, note]);
  }

  Future<void> _deleteNote(String noteId) async {
    await _repository.deleteNote(noteId);
    if (!mounted) return;
    setState(() => _notes = _notes.where((note) => note.id != noteId).toList());
  }

  void _updateStudent(Student student) {
    setState(() => _student = student);
  }

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      student: _student,
      notes: _notes,
      isLoading: _isLoading,
      error: _error,
      updateStudent: _updateStudent,
      addNote: _addNote,
      deleteNote: _deleteNote,
      reloadNotes: _reloadNotes,
      child: widget.child,
    );
  }
}
