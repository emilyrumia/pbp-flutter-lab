class Budget {

  String judul;
  int nominal;
  String tipe;
  DateTime tanggal;
  static List<Budget> listBudget = [];

  Budget ({
    required this.judul,
    required this.nominal,
    required this.tipe,
    required this.tanggal,
  });

  static void tambah ({
    required judul,
    required nominal,
    required tipe,
    required tanggal,
    }) { 
    listBudget.add(Budget(
      judul: judul,
      nominal: nominal,
      tipe: tipe,
      tanggal: tanggal,
    ));
  }
}
