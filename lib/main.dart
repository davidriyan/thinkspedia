import 'package:flutter/material.dart';
import 'shared_preferences_example.dart';
// import 'package:week_one_thinkspedia/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharedPreferencesExample(),
    );
  }
}
