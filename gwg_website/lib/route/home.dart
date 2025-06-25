import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0009BD), // #0009bd
              Color(0xFF000000), // #000000
            ],
          ),
        ),
        child: Row(
          children: [
            NavRail(selectedIndex: 0), // Navigation bar on the left
            // Content area
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "About Me",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          final textStyle = const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          );

                          if (constraints.maxWidth > 850) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello, I’m S.Ganapathi Subramaniam (Gana)!",
                                        style: textStyle.copyWith(fontSize: 20),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                        style: textStyle,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing awe in Automation & Quality in everything I do.",
                                        style: textStyle,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "My motto: LISTEN | LEARN | LEAD",
                                        style: textStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/GS_HS.png',
                                    fit: BoxFit.contain,
                                    height: 250,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Text(
                                              'Ganapathi Subramaniam',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello, I’m S.Ganapathi Subramaniam (Gana)!",
                                      style: textStyle.copyWith(fontSize: 20),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                      style: textStyle,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing awe in Automation & Quality in everything I do.",
                                      style: textStyle,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "My motto: LISTEN | LEARN | LEAD",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Image.asset(
                                  'images/GS_HS.png',
                                  fit: BoxFit.contain,
                                  height: 250,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text(
                                            'Ganapathi Subramaniam',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
