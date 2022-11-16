import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'models/budget.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Data Budget'),
      ),
      drawer: const MyDrawerPage(),
      body: SingleChildScrollView(
        child: Budget.listBudget.isEmpty
            ? Column(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tidak ada data!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )
            : Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: Budget.listBudget.map((Budget data) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.judul,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  data.tanggal.toString().split(' ')[0],
                                  style: const TextStyle(fontSize: 12.0, 
                                  color: Color.fromARGB(255, 255, 0, 0)),
                                )
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data.nominal.toString(),
                                    style: const TextStyle(fontSize: 14.0)),
                                Text(
                                  data.tipe,
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}
