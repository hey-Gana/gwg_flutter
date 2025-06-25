import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/hobbies_model.dart';
import '../widgets/expandable_card.dart';
import '../widgets/navbar.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  final List<Music> musicList = [
    Music(imagePath: 'images/iit.png', youtubeUrl: 'https://www.youtube.com'),
    Music(
      imagePath: 'images/sastra.png',
      youtubeUrl: 'https://www.youtube.com',
    ),
  ];

  final List<Photos> photoList = [
    Photos(imagePath: 'images/iit.png'),
    Photos(imagePath: 'images/sastra.png'),
  ];

  final List<Book> bookList = [
    Book(
      title: 'Atomic Habits',
      review:
          'A practical guide to building good habits and breaking bad ones.',
      goodreadsUrl:
          'https://www.goodreads.com/book/show/40121378-atomic-habits',
    ),
    Book(
      title: 'The Alchemist',
      review: 'A magical story about following your dreams.',
      goodreadsUrl: 'https://www.goodreads.com/book/show/865.The_Alchemist',
    ),
  ];

  final PageController _musicController = PageController(viewportFraction: 0.8);
  final PageController _photoController = PageController(viewportFraction: 0.8);

  int _selectedIndex = 4; // "Hobbies" index in your nav list

  void _previousPage(PageController controller) {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage(PageController controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _musicController.dispose();
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            NavRail(selectedIndex: _selectedIndex),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandableCard(
                          title: '🎵 Music Videos',
                          description:
                              'Watch some of my favorite instrument performances.',
                          expandedContent: SizedBox(
                            height: 220,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _musicController,
                                  itemCount: musicList.length,
                                  itemBuilder: (context, index) {
                                    final music = musicList[index];
                                    return GestureDetector(
                                      onTap:
                                          () => launchUrl(
                                            Uri.parse(music.youtubeUrl),
                                          ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(music.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        width: 300,
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white70,
                                      ),
                                      onPressed:
                                          () => _previousPage(_musicController),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                      ),
                                      onPressed:
                                          () => _nextPage(_musicController),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ExpandableCard(
                          title: '📸 Photography',
                          description:
                              'Snapshots I’ve taken on my photography journey.',
                          expandedContent: SizedBox(
                            height: 220,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _photoController,
                                  itemCount: photoList.length,
                                  itemBuilder: (context, index) {
                                    final photo = photoList[index];
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(photo.imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      width: 300,
                                    );
                                  },
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white70,
                                      ),
                                      onPressed:
                                          () => _previousPage(_photoController),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                      ),
                                      onPressed:
                                          () => _nextPage(_photoController),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ExpandableCard(
                          title: '📚 Book Reviews',
                          description:
                              'My thoughts on books I’ve read recently.',
                          expandedContent: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                bookList.map((book) {
                                  return ListTile(
                                    title: Text(
                                      book.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      book.review,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.open_in_new,
                                        color: Colors.white,
                                      ),
                                      onPressed:
                                          () => launchUrl(
                                            Uri.parse(book.goodreadsUrl),
                                          ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
