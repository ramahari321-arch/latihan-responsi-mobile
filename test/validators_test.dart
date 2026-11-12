import 'package:flutter_test/flutter_test.dart';
import 'package:responsi_profil_mahasiswa/utils/validators.dart';

void main() {
  test('judul hanya valid jika panjang 3 sampai 50', () {
    expect(Validators.validateTitle('ab'), isNotNull);
    expect(Validators.validateTitle('abc'), isNull);
    expect(Validators.validateTitle('a' * 51), isNotNull);
  });

  test('isi hanya valid jika panjang 10 sampai 1000', () {
    expect(Validators.validateContent('pendek'), isNotNull);
    expect(Validators.validateContent('1234567890'), isNull);
    expect(Validators.validateContent('x' * 1001), isNotNull);
  });

  test('sanitasi menghapus karakter yang dilarang soal', () {
    expect(Validators.sanitize(" <a>\"'b "), 'ab');
  });
}
