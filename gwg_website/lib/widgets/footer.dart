// lib/widgets/footer.dart
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              tooltip: "LinkedIn",
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
            ),
            IconButton(
              tooltip: "GitHub",
              onPressed: () {},
              icon: const Icon(Icons.code),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  //   void _launchLinkedIn() async {
  //     final Uri url = Uri.parse(
  //       'https://www.linkedin.com/in/ganapathi-subramaniam/',
  //     );
  //     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
  //       throw 'Could not launch $url';
  //     }
  //   }

  //   void _launchGitHub() async {
  //     final Uri url = Uri.parse('https://github.com/hey-Gana');
  //     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }
}
