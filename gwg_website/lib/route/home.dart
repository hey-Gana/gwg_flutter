import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:gwg_website/widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          NavRail(selectedIndex: 0),
          Expanded(
            child: Column(
              children: [
                Expanded(child: Center(child: Text('About Me Page'))),
                // Footer(), // This will appear at the bottom inside the right panel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
