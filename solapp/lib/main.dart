import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './screens/bid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainPage());
}

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
        body: App(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
