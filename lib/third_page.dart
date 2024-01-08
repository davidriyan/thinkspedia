import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final bool isDark;

  const ThirdPage({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
        ),
      ),
    );
  }
}
