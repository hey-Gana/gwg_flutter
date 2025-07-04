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

    const headingStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const subHeadingStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const timePeriodStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const locationStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 14,
      color: Colors.white70,
    );

    const positionStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const companyStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 14,
      fontStyle: FontStyle.italic,
      color: Colors.white70,
    );

    const descriptionStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 13,
      color: Colors.white,
    );

    const chipTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

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
                        child: Text("Work Experience", style: headingStyle),
                      ),
                      const SizedBox(height: 32),

                      // ✅ Responsive timeline
                      isMobile
                          ? _buildMobileTimeline(
                            timePeriodStyle,
                            locationStyle,
                            positionStyle,
                            companyStyle,
                            descriptionStyle,
                          )
                          : _buildDesktopTimeline(
                            timePeriodStyle,
                            locationStyle,
                            positionStyle,
                            companyStyle,
                            descriptionStyle,
                          ),

                      const SizedBox(height: 48),
                      const Center(
                        child: Text("Tech Stack", style: headingStyle),
                      ),
                      const SizedBox(height: 24),
                      glassyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionSubHeading("Languages", subHeadingStyle),
                            buildTechChips(languages, chipTextStyle),
                            const SizedBox(height: 16),
                            sectionSubHeading("Frameworks", subHeadingStyle),
                            buildTechChips(frameworks, chipTextStyle),
                            const SizedBox(height: 16),
                            sectionSubHeading("Tools", subHeadingStyle),
                            buildTechChips(tools, chipTextStyle),
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

  Widget _buildDesktopTimeline(
    TextStyle timePeriodStyle,
    TextStyle locationStyle,
    TextStyle positionStyle,
    TextStyle companyStyle,
    TextStyle descriptionStyle,
  ) {
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
                    style: timePeriodStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(experienceData[index].location, style: locationStyle),
                ],
              ),
          contentsBuilder: (context, index) {
            final experience = experienceData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: _buildExperienceContent(
                experience,
                positionStyle,
                companyStyle,
                descriptionStyle,
              ),
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

  Widget _buildMobileTimeline(
    TextStyle timePeriodStyle,
    TextStyle locationStyle,
    TextStyle positionStyle,
    TextStyle companyStyle,
    TextStyle descriptionStyle,
  ) {
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
                    Text(exp.timePeriod, style: timePeriodStyle),
                    const SizedBox(height: 4),
                    Text(exp.location, style: locationStyle),
                    const SizedBox(height: 8),
                    _buildExperienceContent(
                      exp,
                      positionStyle,
                      companyStyle,
                      descriptionStyle,
                    ),
                    const Divider(color: Colors.white30, thickness: 1),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildExperienceContent(
    ExperienceModel experience,
    TextStyle positionStyle,
    TextStyle companyStyle,
    TextStyle descriptionStyle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(experience.position, style: positionStyle),
        Text(experience.companyName, style: companyStyle),
        const SizedBox(height: 8),
        ...experience.descriptions.map(
          (desc) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text("• $desc", style: descriptionStyle),
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
                color: const Color.fromARGB(
                  255,
                  0,
                  0,
                  0,
                ).withAlpha(76), // replaced withAlpha for opacity fix
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionSubHeading(String title, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: style),
    );
  }

  Widget buildTechChips(List<String> items, TextStyle textStyle) {
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
              child: Text(tech, style: textStyle),
            );
          }).toList(),
    );
  }
}

//Experience Data
final List<ExperienceModel> experienceData = [
  ExperienceModel(
    companyName: 'Kaplan Institute - Illinois Institute of Technology',
    timePeriod: 'Sep 2023 - May 2025',
    position: 'Operations & Data Analyst',
    location: 'Chicago, USA',
    descriptions: [
      'Developed dashboards and automation scripts for the academic leadership team, allowing them to assess and address student needs, enhancing support and enriching program quality.',
      'Mentored students in validating startup ideas, leading to 4 startups competing in the Annual Pitchfest Competition.',
      'Led workshops for the Startup Studio club on Leadership, Strategy, Solutioning, and Customer Discovery, boosting student engagement by 200%.',
    ],
  ),
  ExperienceModel(
    companyName: 'Syndigo LLC',
    timePeriod: 'Jun 2024 - Nov 2024',
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

//Tech Stack
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
