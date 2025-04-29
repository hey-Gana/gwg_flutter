import 'package:flutter/material.dart';
import 'route/home.dart';
import 'route/experience.dart';
import 'route/contactme.dart';
import 'route/education.dart';
import 'route/projects.dart';
import 'route/hobbies.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome",
      initialRoute: "/home",
      routes: {
        '/home': (context) => const HomePage(),
        '/experience': (context) => const Experience(),
        '/education': (context) => const Education(),
        '/projects': (context) => const Projects(),
        '/hobbies': (context) => const Hobbies(),
        '/contact': (context) => const ContactMe(),
      },
    );
  }
}
