//model for projects
class Project {
  final String title;
  final List<String> descriptions;
  final String imagePath;
  final String url;

  Project({
    required this.title,
    required this.descriptions,
    required this.imagePath,
    required this.url,
  });
}
