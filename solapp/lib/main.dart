import 'package:flutter/material.dart';
import 'pages/card.dart';

void main() => runApp(const MainPage());

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
