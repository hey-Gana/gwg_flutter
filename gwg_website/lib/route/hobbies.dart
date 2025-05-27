import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:gwg_website/models/hobbies_model.dart';

// Controls whether each card is expanded: Music, Photos, Books
final ValueNotifier<List<bool>> expandedStates = ValueNotifier([
  false,
  false,
  false,
]);

class Hobbies extends StatelessWidget {
  const Hobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Navigation Bar
          const NavRail(selectedIndex: 4),

          // Hobbies section
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Hobbies",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    ValueListenableBuilder<List<bool>>(
                      valueListenable: expandedStates,
                      builder:
                          (context, states, _) => Column(
                            children: [
                              // Music Card with fixed size
                              SizedBox(
                                width: 550,
                                //height: 150,
                                child: buildExpandableCard(
                                  title: "Music",
                                  description:
                                      "I love playing musical instruments and often record covers of my favorite songs.",
                                  expanded: states[0],
                                  onTap: () {
                                    final updated = List<bool>.from(states);
                                    updated[0] = !updated[0];
                                    expandedStates.value = updated;
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          musicList.map((music) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    music.imagePath,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  InkWell(
                                                    onTap:
                                                        () => launchUrl(
                                                          Uri.parse(
                                                            music.youtubeUrl,
                                                          ),
                                                        ),
                                                    child: Text(
                                                      music.youtubeUrl,
                                                      style: const TextStyle(
                                                        color: Colors.blue,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Photos Card with fixed size
                              SizedBox(
                                width: 550,
                                //height: 320,
                                child: buildExpandableCard(
                                  title: "Photos",
                                  description:
                                      "Photography is my way of capturing stories in light. Here are some of my favorites.",
                                  expanded: states[1],
                                  onTap: () {
                                    final updated = List<bool>.from(states);
                                    updated[1] = !updated[1];
                                    expandedStates.value = updated;
                                  },
                                  child: SingleChildScrollView(
                                    child: Wrap(
                                      spacing: 12,
                                      runSpacing: 12,
                                      children:
                                          photoList.map((photo) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                photo.imagePath,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Books Card with fixed size
                              SizedBox(
                                width: 550,
                                //height: 320,
                                child: buildExpandableCard(
                                  title: "Books",
                                  description:
                                      "I enjoy reading and reviewing books across various genres.",
                                  expanded: states[2],
                                  onTap: () {
                                    final updated = List<bool>.from(states);
                                    updated[2] = !updated[2];
                                    expandedStates.value = updated;
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          bookList.map((book) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    book.title,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(book.review),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for expandable cards
Widget buildExpandableCard({
  required String title,
  required String description,
  required bool expanded,
  required VoidCallback onTap,
  required Widget child,
}) {
  return Card(
    elevation: 4,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            if (expanded) child,
          ],
        ),
      ),
    ),
  );
}

// Sample Data
final List<Music> musicList = [
  Music(imagePath: 'images/', youtubeUrl: 'https://youtube.com/example1'),
  Music(
    imagePath: 'assets/images/guitar.jpg',
    youtubeUrl: 'https://youtube.com/example2',
  ),
];

final List<Photos> photoList = [
  Photos(imagePath: 'assets/images/photo1.jpg'),
  Photos(imagePath: 'assets/images/photo2.jpg'),
];

final List<Book> bookList = [
  Book(
    title: 'The Alchemist',
    review:
        'A beautiful story about following your dreams and listening to your heart.',
  ),
  Book(
    title: '1984',
    review:
        'A chilling dystopian novel that explores surveillance and freedom.',
  ),
];
