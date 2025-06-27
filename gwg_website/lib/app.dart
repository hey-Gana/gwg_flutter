import 'package:flutter/material.dart';
import 'route/home.dart';
import 'route/experience.dart';
import 'route/education.dart';
import 'route/projects.dart';
import 'route/hobbies.dart';
// import 'route/contactme.dart';
// import 'route/resume.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Welcome",
      initialRoute: "/home",
      routes: {
        '/home': (context) => const HomePage(),
        '/experience': (context) => const Experience(),
        '/education': (context) => const Education(),
        '/projects': (context) => const Projects(),
        '/hobbies': (context) => Hobbies(),
        // '/contact': (context) => const ContactMe(),
        // '/resume': (context) => const ResumePage(),
      },
      onUnknownRoute:
          (settings) =>
              MaterialPageRoute(builder: (context) => const HomePage()),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'RobotoMono', // ✅ Applies Roboto Mono globally
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            // Page titles
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            // Section headings
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            // Subheadings
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
          bodyLarge: TextStyle(
            // Main content
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white70,
          ),
          bodyMedium: TextStyle(
            // Descriptions, captions
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
