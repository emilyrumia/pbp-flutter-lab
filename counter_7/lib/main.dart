import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = "Program Counter";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool check = _counter % 2 == 0;
    bool isVisible = _counter > 0;

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(widget.title),
        ),
        // Menambahkan drawer menu
        drawer: const MyDrawerPage(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              check
                  ? const Text(
                      'GENAP',
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text(
                      'GANJIL',
                      style: TextStyle(color: Colors.blue),
                    ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Visibility(
              visible: isVisible,
              child: Positioned(
                left: 30,
                bottom: 20,
                child: FloatingActionButton(
                  tooltip: 'Decrement',
                  onPressed: _decrementCounter,
                  child: const Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                tooltip: 'Increment',
                onPressed: _incrementCounter,
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ],
        ));
  }
}
