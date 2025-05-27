class Music {
  final String imagePath;
  final String youtubeUrl;

  Music({required this.imagePath, required this.youtubeUrl});
}

class Photos {
  final String imagePath;
  final String? description;

  Photos({required this.imagePath, this.description});
}

class Book {
  final String title;
  final String review;

  Book({required this.title, required this.review});
}
