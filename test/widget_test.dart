import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:responsi_profil_mahasiswa/main.dart';
import 'package:responsi_profil_mahasiswa/providers/app_provider.dart';

void main() {
  testWidgets('Menampilkan profil singkat dan empty state', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const AppProviderWrapper(child: ResponsiApp()));
    await tester.pumpAndSettle();

    expect(find.text('Nama Mahasiswa · NIM'), findsOneWidget);
    expect(
      find.text('Belum ada catatan. Tekan + untuk menambah.'),
      findsOneWidget,
    );
  });
}
