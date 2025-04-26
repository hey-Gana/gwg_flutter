import 'package:flutter/material.dart';
import 'route/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome",
      initialRoute: "/home",
      routes: {
        '/home': (context) => const HomePage(),
        //'/expereience': (context) => const Experience(),
      },
    );
  }
}
