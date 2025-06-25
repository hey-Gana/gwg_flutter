import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import '../models/project_model.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0009BD), // Blue
              Color(0xFF000000), // Black
            ],
          ),
        ),
        child: Row(
          children: [
            const NavRail(selectedIndex: 3),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ...projects.map((project) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            final isWide = constraints.maxWidth > 850;

                            final textContent = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...project.descriptions.map(
                                  (desc) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );

                            final imageContent = Image.asset(
                              project.imagePath,
                              height: 250,
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (context, error, stackTrace) => Text(
                                    project.title,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                            );

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 32.0),
                              child:
                                  isWide
                                      ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(flex: 2, child: textContent),
                                          const SizedBox(width: 40),
                                          Expanded(
                                            flex: 1,
                                            child: imageContent,
                                          ),
                                        ],
                                      )
                                      : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textContent,
                                          const SizedBox(height: 20),
                                          Center(child: imageContent),
                                        ],
                                      ),
                            );
                          },
                        );
                      }),
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

// List of projects
final List<Project> projects = [
  Project(
    title: "AutoApplyLn",
    descriptions: [
      "1. Automated the job application process, achieving an 80% increase in efficiency, by developing a tool that enabled users to filter LinkedIn job postings.",
      "2. Enhanced user experience and improved networking efficiency by creating an intuitive frontend interface, and by generating an Excel report that logs all application details and collects HR contacts, helping users build a valuable professional network.",
    ],
    imagePath: 'images/autoApplyLn.png',
  ),
];
