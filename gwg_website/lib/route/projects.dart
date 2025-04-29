import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
//import 'package:gwg_website/widgets/footer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          //list of children
          NavRail(selectedIndex: 3), //Navigation Bar
          Expanded(
            child: Row(
              children: [
                Expanded(child: Center(child: Text('Projects'))),
                //Footer(), // This will appear at the bottom inside the right panel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
