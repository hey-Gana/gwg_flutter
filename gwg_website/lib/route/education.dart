import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Illinois Institute of Technology
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 850) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text Section
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Illinois Institute of Technology",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Master's in Applied Science – Computer Science (Specialization: Software Engineering)",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Coursework",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Software Engineering, Software Project Management, Software System Architecture, "
                                      "Database Organization, Big Data Technologies, Data Processing & Analysis, "
                                      "Mobile Application Development, Software Testing & Analysis",
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Student Organizations",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Startup Studio Club, SEDS - Students for the Exploration & Development of Space",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 40),
                              // Image Section
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'images/iit.png',
                                  height: 250, // Ensure consistent height
                                  fit:
                                      BoxFit
                                          .contain, // Ensure full image visibility
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text(
                                            'Illinois Institute of Technology',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // For smaller screens
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Illinois Institute of Technology",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Master's in Applied Science – Computer Science (Specialization: Software Engineering)",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Coursework",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Software Engineering, Software Project Management, Software System Architecture, "
                                "Database Organization, Big Data Technologies, Data Processing & Analysis,"
                                "Mobile Application Development, Software Testing & Analysis",
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Student Organizations",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Startup Studio Club, SEDS - Students for the Exploration & Development of Space",
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Image.asset(
                                  'images/iit.png',
                                  height: 250, // Ensure consistent height
                                  fit:
                                      BoxFit
                                          .contain, // Ensure full image visibility
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text(
                                            'Illinois Institute of Technology',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    // Sastra University
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 850) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text Section
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Sastra University",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Bachelors in Technology - Mechanical Engineering",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Coursework",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Software Engineering, Web Application Development using Java, Web Technology, Management Information Systems, Operation Research",
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Student Organizations",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Entrepreneurship Club (E-Cell Sastra), Sakshama - Mechanical Engineering Club",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 80),
                              // Image Section
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'images/sastra.png', // Corrected image path
                                  height: 250, // Ensure consistent height
                                  fit:
                                      BoxFit
                                          .contain, // Ensure full image visibility
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text(
                                            'Sastra University',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // For smaller screens
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sastra University",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Bachelors in Technology - Mechanical Engineering",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Coursework",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Software Engineering, Web Application Development using Java, Web Technology, Management Information Systems, Operation Research",
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Student Organizations",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Entrepreneurship Club (E-Cell Sastra), Sakshama - Mechanical Engineering Club",
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Image.asset(
                                  'images/sastra.png', // Corrected image path
                                  height: 250, // Ensure consistent height
                                  fit:
                                      BoxFit
                                          .contain, // Ensure full image visibility
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Text(
                                            'Sastra University',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
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
    );
  }
}
