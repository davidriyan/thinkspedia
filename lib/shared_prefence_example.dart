import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceExample extends StatefulWidget {
  const SharedPrefenceExample({super.key});

  @override
  State<SharedPrefenceExample> createState() => _SharedPrefenceExampleState();
}

class _SharedPrefenceExampleState extends State<SharedPrefenceExample> {
  int counter = 0;
  Future<void> setPreference() async {
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('myData')) {
      sharedPreference.clear();
    }
    final myData = json.encode({
      'counter': counter.toString(),
    });
    sharedPreference.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreference() async {
    final sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.containsKey('myData')) {
      final myData =
          json.decode(sharedPreference.getString('myData') ?? 'Data Null')
              as Map<String, dynamic>;
      counter = int.parse(myData['counter']);
    }
  }

  void add() {
    counter = counter + 1;
    setPreference();
  }

  void minus() {
    counter = counter - 1;
    setPreference();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreference(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preference'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'data ke : $counter',
              style: const TextStyle(fontSize: 30),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: minus, icon: const Icon(Icons.remove)),
                IconButton(onPressed: add, icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
