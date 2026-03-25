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

//samle data
final List<ArticleModel> articles = [
  ArticleModel(
    title: 'Flutter 4.0: What to Expect',
    content:
        'In this article we break down Flutter 4.0 features, performance updates, and the new Material 3 APIs.',
    fullName: 'Mina Takahashi',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=1',
        altText: 'Flutter code screenshot',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  ArticleModel(
    title: 'State Management in 2026',
    content:
        'A practical guide to provider, Riverpod, BLoC, and new patterns for production apps.',
    fullName: 'Daniel Cho',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=2',
        altText: 'State graph',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  ArticleModel(
    title: 'Design Systems with Figma + Flutter',
    content:
        'How to sync your Figma tokens into Flutter and keep consistent styles across teams.',
    fullName: 'Nia Herrera',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=3',
        altText: 'Design system cards',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
  ArticleModel(
    title: 'Building Fast Offline Apps',
    content:
        'Learn offline caching patterns with sqflite, ObjectBox, and Firestore in Flutter apps.',
    fullName: 'Leo Patel',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=4',
        altText: 'Offline app icon',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  ArticleModel(
    title: 'Accessibility in Flutter',
    content:
        'A checklist for using semantics, contrast, and keyboard navigation in your app.',
    fullName: 'Aya Rivera',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=5',
        altText: 'Accessibility features',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
  ),
  ArticleModel(
    title: 'Advanced Animations',
    content:
        'Create rich motion experiences with AnimatedBuilder, custom Physics, and Implicit animations.',
    fullName: 'Jonas Weber',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=6',
        altText: 'Animation timeline',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 8)),
  ),
  ArticleModel(
    title: 'Clean Architecture for Flutter',
    content:
        'How to organize features, layers, and tests for maintainable apps.',
    fullName: 'Sofia Mendez',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=7',
        altText: 'Architecture diagram',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  ArticleModel(
    title: 'Flutter Web Production Tips',
    content: 'Optimize bundle size, caching, and SEO for web deployments.',
    fullName: 'Ravi Kumar',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=8',
        altText: 'Flutter web preview',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
  ),
  ArticleModel(
    title: 'Testing with Flutter 4',
    content:
        'Unit, widget, and integration test patterns with new test coverage tools.',
    fullName: 'Elena Scott',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=9',
        altText: 'Testing dashboard',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 14)),
  ),
  ArticleModel(
    title: 'Backend for Flutter without Firebase',
    content: 'Using Supabase, Hasura, and REST APIs for scalable app backends.',
    fullName: 'Mika Owusu',
    images: [
      ImageModel(
        imageUrl: 'https://picsum.photos/300/200?random=10',
        altText: 'Backend architecture',
        position: 1,
      ),
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
  ),
];