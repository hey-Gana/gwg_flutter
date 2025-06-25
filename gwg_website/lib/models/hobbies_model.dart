class Music {
  final String imagePath;
  final String youtubeUrl;

  Music({required this.imagePath, required this.youtubeUrl});
}

class Photos {
  final String imagePath;

  Photos({required this.imagePath});
}

class Book {
  final String title;
  final String review;
  final String goodreadsUrl;

  Book({required this.title, required this.review, required this.goodreadsUrl});
}
