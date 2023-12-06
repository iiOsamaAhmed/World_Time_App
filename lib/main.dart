import 'package:flutter/material.dart';
import 'package:wrold_app/pages/loding.dart';
import 'package:wrold_app/pages/home.dart';
import 'package:wrold_app/pages/location.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loding(),
        '/home': (context) => const Home(),
        '/location': (context) => const Location(),
      },
    );
  }
}