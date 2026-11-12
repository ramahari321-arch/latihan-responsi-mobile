import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Akses konfigurasi runtime dari file .env lokal.
class AppConfig {
  AppConfig._();

  /// Alamat dasar API publik.
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  /// Contoh kunci konfigurasi; jangan dicetak dalam log.
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
