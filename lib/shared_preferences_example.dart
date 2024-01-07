import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({super.key});

  @override
  State<SharedPreferencesExample> createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  int counter = 0;
  bool isDark = false;
  Future<void> setPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    //mengecek apakah data myData sudah ada di penyimpanan atau belum
    if (sharedPreferences.containsKey('myData')) {
      sharedPreferences.clear();
    }
    //jika tidak, maka akan membuat data baru menggunakan json.encode
    final myData = json.encode({
      'counter': counter.toString(),
      'isDark': isDark.toString(),
    });
    //Menyimpan string hasil dari encoding JSON ke dalam penyimpanan lokal menggunakan SharedPreferences. Ini memberikan cara sederhana dan efisien untuk menyimpan data kecil secara lokal pada perangkat.
    sharedPreferences.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('myData')) {
      final myData =
          json.decode(sharedPreferences.getString('myData') ?? 'No data')
              as Map<String, dynamic>;
              //bagian di bawah ini adalah proses mengambil data dari objek Dart yang telah di-decode dari string JSON, 
              //dan menggunakannya untuk menginisialisasi nilai beberapa variabel.
      counter = int.parse(myData['counter']);
      isDark = myData['isDark'] == 'true' ? true : false;
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

  void changeTheme() {
    isDark = !isDark;
    setPreferences();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    setPreferences();
  }

  ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pink,
      primarySwatch: Colors.pink);

  ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amber,
      primarySwatch: Colors.green);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreferences(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDark ? dark : light,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Shared Preferences'),
            actions: [
              IconButton(onPressed: refresh, icon: const Icon(Icons.refresh))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Counter ke: $counter',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Gap(20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    onPressed: remove, child: const Icon(Icons.remove)),
                ElevatedButton(onPressed: add, child: const Icon(Icons.add)),
              ]),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: changeTheme,
            child: const Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
