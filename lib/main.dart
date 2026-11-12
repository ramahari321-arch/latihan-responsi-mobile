import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'providers/app_provider.dart';
import 'screens/home_screen.dart';

/// Memuat konfigurasi lokal lalu menjalankan aplikasi.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const AppProviderWrapper(child: ResponsiApp()));
}

/// Menyediakan tema aplikasi yang konsisten.
class ResponsiApp extends StatelessWidget {
  /// Membuat akar aplikasi.
  const ResponsiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil & Catatan Kuliah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
