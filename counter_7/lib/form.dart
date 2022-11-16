import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'models/budget.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final String _selectedDate = 'Pilih Tanggal';
  String _judul = "";
  int _nominal = 0;
  String _tipe = "";
  List<String> listTipe = ["Pemasukan", "Pengeluaran"];
  DateTime? _tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Form Budget'),
      ),
      drawer: const MyDrawerPage(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Judul",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // Menambahkan behavior saat nominal diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(_tipe == "" ? 'Pilih jenis' : _tipe),
                  items: listTipe.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _tipe = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container (
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                InkWell(
                                  child: Text(_selectedDate,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF000000)))),
                                IconButton(
                                  icon: const Icon(
                                      Icons.calendar_month_outlined, color: Colors.blue),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2015),
                                      lastDate: DateTime(2100),
                                    ).then((value) {
                                      setState(() {
                                        _tanggal = value;
                                      });
                                    });
                                  },
                                ),
                              ]
                            )
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Budget.tambah(
                          judul: _judul,
                          nominal: _nominal,
                          tipe: _tipe,
                          tanggal: _tanggal,
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Icon(Icons.info_outline),
                                  const Center(
                                      child: Text('Berhasil Menambahkan Data!')),
                                  const SizedBox(height: 20),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    style: ButtonStyle(
                      padding:
                          // Menggunakan padding sebesar 20 pixels
                          MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
