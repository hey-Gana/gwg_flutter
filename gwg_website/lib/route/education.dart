import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
//import 'package:gwg_website/widgets/footer.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          //list of children
          NavRail(selectedIndex: 2), //Navigation Bar
          Expanded(
            child: Row(
              children: [
                Expanded(child: Center(child: Text('Education'))),
                //Footer(), // This will appear at the bottom inside the right panel
              ],
            ),
          ),
        ],
      ),
    );
  }
}
