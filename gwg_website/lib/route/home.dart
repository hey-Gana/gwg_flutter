import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Row for text and image
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 850) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text section
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Hello, I’m S.Ganapathi Subramaniam (Gana)!",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing awe in Automation & Quality in everything I do.",
                                    ),
                                    SizedBox(height: 10),
                                    Text("My motto: LISTEN | LEARN | LEAD"),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 40),

                              // Image section
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'images/GS_HS.png',
                                  fit: BoxFit.contain,
                                  height: 250, // Adjust height for consistency
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text('Ganapathi Subramaniam'),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              // Stack vertically for narrow screens
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Hello, I’m Gana! 👋",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing awe in Automation & Quality in everything I do.",
                                  ),
                                  SizedBox(height: 8),
                                  Text("My motto: LISTEN | LEARN | LEAD"),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Image.asset(
                                'images/GS_HS.png',
                                fit: BoxFit.contain,
                                height:
                                    250, // Ensure consistent height on smaller screens
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Text('Ganapathi Subramaniam'),
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
    );
  }
}
