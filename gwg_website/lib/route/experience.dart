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
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0009BD), Color(0xFF000000)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
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
                            color: Colors.white,
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
                          color: const Color.fromARGB(255, 9, 37, 127),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FixedTimeline.tileBuilder(
                          builder: TimelineTileBuilder.connected(
                            connectionDirection: ConnectionDirection.before,
                            itemCount: experienceData.length,
                            contentsAlign: ContentsAlign.basic,

                            // Removed itemExtentBuilder to allow dynamic height
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      experienceData[index].location,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),

                            contentsBuilder: (context, index) {
                              final experience = experienceData[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      experience.position,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      experience.companyName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ...experience.descriptions.map(
                                      (desc) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 4.0,
                                        ),
                                        child: Text(
                                          "• $desc",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },

                            indicatorBuilder: (context, index) {
                              return const DotIndicator(
                                size: 16.0,
                                color: Colors.white,
                              );
                            },
                            connectorBuilder: (context, index, connectorType) {
                              return const SolidLineConnector(
                                color: Colors.white,
                                thickness: 2.0,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    const Center(
                      child: Text(
                        "Tech Stack",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    sectionSubHeading("Languages"),
                    buildTechChips(languages),

                    const SizedBox(height: 16),

                    sectionSubHeading("Frameworks"),
                    buildTechChips(frameworks),

                    const SizedBox(height: 16),

                    sectionSubHeading("Tools"),
                    buildTechChips(tools),

                    const SizedBox(height: 48),
                  ],
                ),
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
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
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
            items
                .map(
                  (tech) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2B3C),
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
                  ),
                )
                .toList(),
      ),
    );
  }
}

// Experience Data
final List<ExperienceModel> experienceData = [
  ExperienceModel(
    companyName: 'Kaplan Institute - Illinois Institute of Technology',
    timePeriod: 'Sep 2023 - May 2025',
    position: 'Data Analyst & Operations',
    location: 'Chicago, USA',
    descriptions: [
      'Developed a low-code automation framework enabling citizen testers to independently create and execute test cases, increasing automation coverage by 20%.',
      'Orchestrated a continuous testing pipeline with 80% API coverage by automating 25+ APIs and 100+ scenarios using Python and Playwright, ensuring data consistency and business alignment.',
      'Created a validation module automating checks for 25+ APIs in Azure storage, ensuring 100% data transformation accuracy across multiple products.',
      'Operationalized end-to-end (E2E) automation, achieving 40% UI test coverage post data model synchronization, enhancing overall testing efficiency and system accuracy.',
    ],
  ),
  ExperienceModel(
    companyName: 'Syndigo LLC',
    timePeriod: 'Jun 2025 - Nov 2025',
    position: 'Software Intern',
    location: 'Chicago, USA',
    descriptions: [
      'Developed a low-code automation framework enabling citizen testers to independently create and execute test cases, increasing automation coverage by 20%.',
      'Orchestrated a continuous testing pipeline with 80% API coverage by automating 25+ APIs and 100+ scenarios using Python and Playwright, ensuring data consistency and business alignment.',
      'Created a validation module automating checks for 25+ APIs in Azure storage, ensuring 100% data transformation accuracy across multiple products.',
      'Operationalized end-to-end (E2E) automation, achieving 40% UI test coverage post data model synchronization, enhancing overall testing efficiency and system accuracy.',
    ],
  ),
  ExperienceModel(
    companyName: 'Cognizant Technology Solutions',
    timePeriod: 'Aug 2020 - Jul 2023',
    position: 'Associate',
    location: 'Bangalore, India',
    descriptions: [
      'Designed and Engineered an extensible Automated Reporting System using Python and HTML/CSS for senior leadership, cutting manual effort and reporting time by 95%.',
      'Developed a reusable Test Automation Framework with Python and Robot Framework, improving testing efficiency and slashing regression effort from 70 to 3 man-days.',
      'Implemented automation for 200+ regression test cases and added new scenarios each sprint, increasing coverage by 40% and maintaining test quality.',
      'Spearheaded adoption of automation frameworks across client projects, boosting offshore collaboration and enabling effective resource management by the senior leadership team, ultimately improving project delivery.',
      'Orchestrated sprint-wise functional demos, expediting production deployments by 1 week each and improving stakeholder alignment and trust.',
    ],
  ),
];

// Tech Stack Lists
final List<String> languages = ['Dart', 'Python', 'JavaScript', 'SQL'];
final List<String> frameworks = ['Flutter', 'React', 'Node.js', 'Playwright'];
final List<String> tools = ['Git', 'Docker', 'AWS', 'CI/CD'];
