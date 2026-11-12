import 'package:flutter/material.dart';

import '../services/public_api_service.dart';

/// Halaman pengguna publik dari HTTP GET /users.
class PublicUsersScreen extends StatefulWidget {
  /// Membuat halaman API.
  const PublicUsersScreen({super.key});

  @override
  State<PublicUsersScreen> createState() => _PublicUsersScreenState();
}

class _PublicUsersScreenState extends State<PublicUsersScreen> {
  final _api = PublicApiService();
  List<String> _users = [];
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final users = await _api.getUsers();
      if (!mounted) return;
      setState(() {
        _users = users;
        _loading = false;
      });
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error.message;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Gagal memuat pengguna. Coba lagi.';
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _api.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Pengguna Publik')),
    body: _loading
        ? const Center(child: CircularProgressIndicator())
        : _error != null
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_error!),
                TextButton(onPressed: _load, child: const Text('Coba lagi')),
              ],
            ),
          )
        : _users.isEmpty
        ? const Center(child: Text('Tidak ada pengguna.'))
        : ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(_users[index]),
            ),
          ),
  );
}
