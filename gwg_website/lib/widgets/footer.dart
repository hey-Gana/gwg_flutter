import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              message: "LinkedIn",
              textStyle: const TextStyle(
                fontFamily: 'RobotoMono',
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: _launchLinkedIn,
                icon: const Icon(
                  Icons.rocket_launch_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Tooltip(
              message: "GitHub",
              textStyle: const TextStyle(
                fontFamily: 'RobotoMono',
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: _launchGitHub,
                icon: const Icon(Icons.code, color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  void _launchLinkedIn() async {
    final Uri url = Uri.parse(
      'https://www.linkedin.com/in/ganapathi-subramaniam/',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/hey-Gana');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
