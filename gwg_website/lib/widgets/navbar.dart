import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Represents a single navigation destination.
class Destination {
  final String label;
  final Icon icon;

  const Destination(this.label, this.icon);
}

/// Static list of destinations.
const List<Destination> destinations = <Destination>[
  Destination('About Me', Icon(Icons.g_mobiledata_outlined)),
  Destination('Experience', Icon(Icons.beenhere_outlined)),
  Destination('Education', Icon(Icons.school_outlined)),
  Destination('Projects', Icon(Icons.token_outlined)),
  Destination('Hobbies', Icon(Icons.local_play_outlined)),
  Destination("Contact Me", Icon(Icons.contact_phone_outlined)),
  Destination('Resume', Icon(Icons.file_present_outlined)),
];

class NavRail extends StatelessWidget {
  final int selectedIndex;

  const NavRail({super.key, required this.selectedIndex});

  /// Launch resume PDF in a new browser tab
  static Future<void> _launchResumePdf() async {
    final uri = Uri.base.resolve(
      'assets/resume/Ganapathi_Subramaniam_S_Resume.pdf',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank', // Open in new tab
      );
    } else {
      debugPrint('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 109, 109, 112),
      child: Column(
        children: [
          Expanded(
            child: NavigationRail(
              backgroundColor: const Color.fromARGB(255, 109, 109, 112),
              selectedIndex: selectedIndex,
              labelType: NavigationRailLabelType.all,
              destinations:
                  destinations
                      .map(
                        (d) => NavigationRailDestination(
                          icon: d.icon,
                          label: Text(d.label),
                        ),
                      )
                      .toList(),
              onDestinationSelected: (int index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, '/home');
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, '/experience');
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, '/education');
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, '/projects');
                    break;
                  case 4:
                    Navigator.pushReplacementNamed(context, '/hobbies');
                    break;
                  case 5:
                    Navigator.pushReplacementNamed(context, '/contact');
                    break;
                  case 6:
                    _launchResumePdf();
                    break;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.webhook_sharp, color: Colors.white),
              onSelected: (value) {
                switch (value) {
                  case 0:
                    launchUrl(
                      Uri.parse('https://www.linkedin.com/in/yourprofile'),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                  case 1:
                    launchUrl(
                      Uri.parse('https://github.com/yourprofile'),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                  case 2:
                    launchUrl(
                      Uri.parse('https://www.goodreads.com/user/show/yourid'),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                }
              },
              itemBuilder:
                  (context) => const [
                    PopupMenuItem<int>(value: 0, child: Text('LinkedIn')),
                    PopupMenuItem<int>(value: 1, child: Text('GitHub')),
                    PopupMenuItem<int>(value: 2, child: Text('Goodreads')),
                  ],
              color: const Color.fromARGB(255, 109, 109, 112),
            ),
          ),
        ],
      ),
    );
  }
}
