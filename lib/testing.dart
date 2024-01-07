import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  int counter = 0;

  Future<void> setPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('myData')) {
      sharedPreferences.clear();
    }
    final myData = json.encode({'counter': counter.toString()});
    sharedPreferences.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('myData')) {
      final myData =
          json.decode(sharedPreferences.getString('myData') ?? 'Tidak ada data')
              as Map<String, dynamic>;
      counter = int.parse(myData['counter']);
    }
  }

  void remove() {
    counter = counter - 1;
    setPreferences();
  }

  void add() {
    counter = counter + 1;
    setPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreferences(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('shared preferences'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter ke: $counter',
              style: const TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: remove, child: const Icon(Icons.remove)),
                ElevatedButton(onPressed: add, child: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
