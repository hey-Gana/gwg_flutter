import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0009BD), Color(0xFF000000)],
          ),
        ),
        child: Row(
          children: [
            const NavRail(selectedIndex: 2),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Education",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // ILLINOIS SECTION
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 850;
                          final imageWidget = Image.asset(
                            'images/iit.png',
                            height: 250,
                            fit: BoxFit.contain,
                            color: Colors.white,
                            errorBuilder:
                                (context, error, stackTrace) => const Text(
                                  'Illinois Institute of Technology',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                          );

                          final content = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Illinois Institute of Technology",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Master's in Applied Science – Computer Science (Specialization: Software Engineering)",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Coursework",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Software Engineering, Software Project Management, Software System Architecture, "
                                "Database Organization, Big Data Technologies, Data Processing & Analysis, "
                                "Mobile Application Development, Software Testing & Analysis",
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Student Organizations",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Startup Studio Club, SEDS - Students for the Exploration & Development of Space",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          );

                          return isWide
                              ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 2, child: content),
                                  const SizedBox(width: 40),
                                  Expanded(flex: 1, child: imageWidget),
                                ],
                              )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  content,
                                  const SizedBox(height: 20),
                                  Center(child: imageWidget),
                                ],
                              );
                        },
                      ),

                      const SizedBox(height: 32),

                      // SASTRA SECTION
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 850;
                          final imageWidget = Image.asset(
                            'images/sastra.png',
                            height: 250,
                            fit: BoxFit.contain,
                            color: Colors.white,
                            errorBuilder:
                                (context, error, stackTrace) => const Text(
                                  'Sastra University',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                          );

                          final content = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Sastra University",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Bachelors in Technology - Mechanical Engineering",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Coursework",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Software Engineering, Web Application Development using Java, Web Technology, "
                                "Management Information Systems, Operation Research",
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Student Organizations",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Entrepreneurship Club (E-Cell Sastra), Sakshama - Mechanical Engineering Club",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          );

                          return isWide
                              ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 2, child: content),
                                  const SizedBox(width: 80),
                                  Expanded(flex: 1, child: imageWidget),
                                ],
                              )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  content,
                                  const SizedBox(height: 20),
                                  Center(child: imageWidget),
                                ],
                              );
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
