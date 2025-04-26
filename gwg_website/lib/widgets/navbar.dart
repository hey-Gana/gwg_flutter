import 'package:flutter/material.dart';

/// Represents a single navigation destination.
class Destination {
  final String label;
  final Icon icon;

  const Destination(this.label, this.icon); // constructor of the class
}

/// Static list of destinations.
const List<Destination> destinations = <Destination>[
  Destination('About Me', Icon(Icons.auto_awesome_mosaic_outlined)),
  Destination('Experience', Icon(Icons.beenhere_outlined)),
  Destination('Education', Icon(Icons.auto_stories_outlined)),
  Destination('Projects', Icon(Icons.token_outlined)),
  Destination('Hobbies', Icon(Icons.local_play_outlined)),
  Destination("Contact Me", Icon(Icons.contact_phone_outlined)),
  Destination('Resume', Icon(Icons.file_present_outlined)),
];

/// Main Navigation Rail widget.
class NavRail extends StatelessWidget {
  final int selectedIndex;

  const NavRail({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Expanded(
            child: NavigationRail(
              backgroundColor: Colors.grey[200],
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
              // Navigation logic
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
                    Navigator.pushReplacementNamed(context, '/resume');
                    break;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.accessibility), // Icon inside button
              onSelected: (value) {
                // Handle the selected value
                if (value == 0) {
                  // Do Option 1 action
                } else if (value == 1) {
                  // Do Option 2 action
                } else if (value == 2) {
                  // Do Option 3 action
                }
              },
              itemBuilder:
                  (context) => [
                    const PopupMenuItem<int>(value: 0, child: Text('Option 1')),
                    const PopupMenuItem<int>(value: 1, child: Text('Option 2')),
                    const PopupMenuItem<int>(value: 2, child: Text('Option 3')),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
