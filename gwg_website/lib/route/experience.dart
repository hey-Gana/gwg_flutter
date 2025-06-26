import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:gwg_website/models/experience_model.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0009BD), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            const NavRail(selectedIndex: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Work Experience",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // ✅ Responsive timeline
                      isMobile
                          ? _buildMobileTimeline()
                          : _buildDesktopTimeline(),

                      const SizedBox(height: 48),
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
                      glassyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionSubHeading("Languages"),
                            buildTechChips(languages),
                            const SizedBox(height: 16),
                            sectionSubHeading("Frameworks"),
                            buildTechChips(frameworks),
                            const SizedBox(height: 16),
                            sectionSubHeading("Tools"),
                            buildTechChips(tools),
                          ],
                        ),
                      ),

                      const SizedBox(height: 48),
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

  Widget _buildDesktopTimeline() {
    return glassyContainer(
      child: FixedTimeline.tileBuilder(
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: experienceData.length,
          contentsAlign: ContentsAlign.basic,
          oppositeContentsBuilder:
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
          contentsBuilder: (context, index) {
            final experience = experienceData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: _buildExperienceContent(experience),
            );
          },
          indicatorBuilder:
              (context, index) =>
                  const DotIndicator(size: 16.0, color: Colors.white),
          connectorBuilder:
              (context, index, _) =>
                  const SolidLineConnector(color: Colors.white, thickness: 2.0),
        ),
      ),
    );
  }

  Widget _buildMobileTimeline() {
    return glassyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            experienceData.map((exp) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.timePeriod,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exp.location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildExperienceContent(exp),
                    const Divider(color: Colors.white30, thickness: 1),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildExperienceContent(ExperienceModel experience) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              "• $desc",
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget glassyContainer({required Widget child}) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionSubHeading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      children:
          items.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
            );
          }).toList(),
    );
  }
}

// 🔍 Experience Data
final List<ExperienceModel> experienceData = [
  ExperienceModel(
    companyName: 'Kaplan Institute - Illinois Institute of Technology',
    timePeriod: 'Sep 2023 - May 2025',
    position: 'Data Analyst & Operations',
    location: 'Chicago, USA',
    descriptions: [
      'Developed dashboards and automation scripts for the academic leadership team...',
      'Mentored students in validating startup ideas...',
      'Led workshops for the Startup Studio club...',
    ],
  ),
  ExperienceModel(
    companyName: 'Syndigo LLC',
    timePeriod: 'Jun 2025 - Nov 2025',
    position: 'Software Intern',
    location: 'Chicago, USA',
    descriptions: [
      'Developed a low-code automation framework...',
      'Orchestrated a continuous testing pipeline...',
      'Created a validation module automating checks...',
      'Operationalized end-to-end (E2E) automation...',
    ],
  ),
  ExperienceModel(
    companyName: 'Cognizant Technology Solutions',
    timePeriod: 'Aug 2020 - Jul 2023',
    position: 'Associate',
    location: 'Bangalore, India',
    descriptions: [
      'Designed an extensible Automated Reporting System...',
      'Developed a reusable Test Automation Framework...',
      'Implemented automation for 200+ regression test cases...',
      'Spearheaded adoption of automation frameworks...',
      'Orchestrated sprint-wise functional demos...',
    ],
  ),
];

// 💡 Tech Stack
final List<String> languages = ['Dart', 'Python', 'JavaScript', 'Java', 'SQL'];
final List<String> frameworks = [
  'Flutter',
  'Flet',
  'Kivy',
  'Angular',
  'Selenium',
  'Robot Framework',
  'Playwright',
  'Bootstrap',
];
final List<String> tools = [
  'Git',
  'Jira',
  'AWS',
  'Postman',
  'IBM Watson',
  'MS Office',
  'AirTable',
  'Notion',
];
