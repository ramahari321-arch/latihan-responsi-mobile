import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';

/// Mengambil data publik dengan penanganan kesalahan jaringan.
class PublicApiService {
  /// Membuat layanan API; client bisa diganti saat pengujian.
  PublicApiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  /// Mengambil nama pengguna dari endpoint publik /users.
  Future<List<String>> getUsers() async {
    try {
      final response = await _client
          .get(Uri.parse('${AppConfig.baseUrl}/users'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode != 200) {
        throw const ApiException('Server tidak tersedia. Coba lagi.');
      }
      final users = jsonDecode(response.body) as List<dynamic>;
      return users
          .map((user) => (user as Map<String, dynamic>)['name'] as String)
          .toList();
    } on TimeoutException {
      throw const ApiException('Koneksi habis waktu. Coba lagi.');
    } on SocketException {
      throw const ApiException('Tidak ada koneksi internet.');
    } on http.ClientException {
      throw const ApiException('Permintaan gagal. Periksa koneksi.');
    } on FormatException {
      throw const ApiException('Format data API tidak valid.');
    }
  }

  /// Melepas koneksi HTTP setelah tidak dipakai.
  void dispose() => _client.close();
}

/// Pesan kesalahan aman untuk ditampilkan pada pengguna.
class ApiException implements Exception {
  /// Membuat kesalahan tanpa informasi sensitif.
  const ApiException(this.message);

  /// Pesan untuk UI.
  final String message;

  @override
  String toString() => message;
}
