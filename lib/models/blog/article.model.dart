class ImageModel {
  final String imageUrl;
  final String? altText;
  final int? position;

  ImageModel({required this.imageUrl, this.altText, this.position});
}

class ArticleModel {
  final String title;
  final String content;
  final List<ImageModel>? images;
  final DateTime createdAt;
  final String? fullName;

  ArticleModel({
    required this.title,
    required this.content,
    this.images,
    required this.createdAt,
    this.fullName,
  });
}

