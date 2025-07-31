import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';
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
            colors: [Color(0xFF0009BD), Color(0xFF000000)],
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
                    children: [
                      const Center(
                        child: Text(
                          "Projects",
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ...projects.map((project) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: glassyContainer(
                            child: projectSection(context, project),
                          ),
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
                color: const Color.fromARGB(255, 0, 0, 0).withAlpha(76),
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget projectSection(BuildContext context, Project project) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;

        final textContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: const TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ...project.descriptions.map(
              (desc) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                final uri = Uri.parse(project.url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {}
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Link",
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
        );

        return isWide
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: textContent),
                const SizedBox(width: 40),
                Expanded(flex: 1, child: imageContent),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textContent,
                const SizedBox(height: 20),
                Center(child: imageContent),
              ],
            );
      },
    );
  }
}

//project list
final List<Project> projects = [
  Project(
    title: "AutoApplyLn",
    descriptions: [
      "1. Automated the job application process, achieving an 80% increase in efficiency, by developing a tool that enabled users to filter LinkedIn job postings.",
      "2. Enhanced user experience and improved networking efficiency by creating an intuitive frontend interface, and by generating an Excel report that logs all application details and collects HR contacts, helping users build a valuable professional network.",
    ],
    imagePath: 'images/autoApplyLn.png',
    url: 'https://github.com/hey-Gana/autoApplyLn',
  ),
  Project(
    title: "TacTics - Competitive twists to classical Tic-Tac-Toe",
    descriptions: [
      "1. Designed and developed a multi-variant Tic-Tac-Toe mobile app in Flutter with efficient game logic and responsive UI.",
      "2. Integrated AI opponent using adversarial search (Minimax), enabling intelligent single-player gameplay.",
      "3. Optimized win/loss/draw evaluation with O(1) time and space complexity for high-performance updates.",
      "4. Built a scalable, reactive architecture supporting rule variation, stacking, and dynamic board interactions.",
    ],
    imagePath: 'images/TacTics_homepage.png',
    url: 'https://github.com/hey-Gana/TacTics',
  ),
];
