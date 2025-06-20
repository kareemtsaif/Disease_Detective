class Article {
  final String id;
  final String title;
  final String description;
  final String image;
  final String content;
  final List<Map<String, String>>? riskFactors;

  Article(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.content,
      this.riskFactors});
}
