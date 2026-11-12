/// Data profil mahasiswa.
class Student {
  /// Membuat data profil mahasiswa.
  const Student({
    required this.name,
    required this.nim,
    required this.programStudi,
    required this.email,
  });

  /// Nama mahasiswa.
  final String name;

  /// Nomor induk mahasiswa.
  final String nim;

  /// Nama program studi.
  final String programStudi;

  /// Alamat email mahasiswa.
  final String email;
}
