import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
//import 'package:gwg_website/widgets/footer.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          //list of children
          NavRail(selectedIndex: 1), //Navigation Bar
          Expanded(
            child: Row(
              children: [
                Expanded(child: Center(child: Text('Experience'))),
                //Footer(), // This will appear at the bottom inside the right panel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
