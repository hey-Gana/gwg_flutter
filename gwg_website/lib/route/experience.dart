import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:gwg_website/models/experience_model.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavRail(selectedIndex: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        "Work Experience",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Timeline Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 127, 130, 132),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FixedTimeline.tileBuilder(
                        builder: TimelineTileBuilder.connected(
                          connectionDirection: ConnectionDirection.before,
                          itemCount: experienceData.length,
                          contentsAlign: ContentsAlign.basic,
                          itemExtentBuilder: (_, __) => 160,
                          oppositeContentsBuilder:
                              (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    experienceData[index].timePeriod,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    experienceData[index].location,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                          contentsBuilder: (context, index) {
                            final experience = experienceData[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  experience.position,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  experience.companyName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "• ${experience.descriptions}",
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            );
                          },
                          indicatorBuilder: (context, index) {
                            return const DotIndicator(
                              size: 16.0,
                              color: Colors.blue,
                            );
                          },
                          connectorBuilder: (context, index, connectorType) {
                            return const SolidLineConnector(
                              color: Colors.black,
                              thickness: 2.0,
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Tech Stack Section Heading
                  const Center(
                    child: Text(
                      "Tech Stack",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Languages
                  sectionSubHeading("Languages"),
                  buildTechChips(languages),

                  const SizedBox(height: 16),

                  // Frameworks
                  sectionSubHeading("Frameworks"),
                  buildTechChips(frameworks),

                  const SizedBox(height: 16),

                  // Tools
                  sectionSubHeading("Tools"),
                  buildTechChips(tools),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionSubHeading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildTechChips(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children:
            items.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 127, 130, 132),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

// Experience Data
final List<ExperienceModel> experienceData = [
  ExperienceModel(
    companyName: 'Syndigo LLC',
    timePeriod: 'Jan 2023 - Dec 2023',
    position: 'Software Intern',
    location: 'Remote',
    descriptions: 'Automated UI and API testing using Playwright and Python.',
  ),
  ExperienceModel(
    companyName: 'TechCorp Solutions',
    timePeriod: 'May 2022 - Aug 2022',
    position: 'QA Intern',
    location: 'New York, USA',
    descriptions: 'Enhanced CI/CD pipeline with automated test scripts.',
  ),
  ExperienceModel(
    companyName: 'Startup Inc.',
    timePeriod: 'June 2021 - Aug 2021',
    position: 'Software Developer Intern',
    location: 'San Francisco, USA',
    descriptions:
        'Worked on backend APIs and integrated them with the frontend.',
  ),
];

// Tech Stack Lists
final List<String> languages = ['Dart', 'Python', 'JavaScript', 'SQL'];

final List<String> frameworks = ['Flutter', 'React', 'Node.js', 'Playwright'];

final List<String> tools = ['Git', 'Docker', 'AWS', 'CI/CD'];
