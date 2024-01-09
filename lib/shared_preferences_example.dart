import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_one_thinkspedia/third_page.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({super.key});

  @override
  State<SharedPreferencesExample> createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  int counter = 0;
  bool isDark = false;
  String name = '';

  TextEditingController nameController = TextEditingController();

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
      'name': name.toString()
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
      //! bagian di bawah ini adalah proses mengambil data dari objek Dart yang telah di-decode dari string JSON,
      //dan menggunakannya untuk menginisialisasi nilai beberapa variabel.
      counter = int.parse(myData['counter']);
      isDark = myData['isDark'] == 'true' ? true : false;
      name = myData['name'];
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

  void nameUser() {
    name = nameController.text;
    setPreferences();
  }

  void changeTheme() {
    isDark = !isDark;
    setPreferences();
  }

  void refresh() {
    counter = 0;
    isDark = false;
    name = '';
    setPreferences();
  }

  ThemeData dark = ThemeData(
      // useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: Colors.pink,
      primarySwatch: Colors.pink);

  ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amber,
      primarySwatch: Colors.green);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: remove,
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: add,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ThirdPage(
                          isDark: isDark,
                          counter: counter,
                          name: name,
                        );
                      },
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward),
              ),
              const Gap(20),
              SizedBox(
                width: size.width / 1.9,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan nama anda',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: nameUser,
                child: const Text('Submit'),
              ),
              const Gap(20),
              Text(
                name.isEmpty ? 'No data' : name,
                style: const TextStyle(fontSize: 20),
              )
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
