import 'package:flutter/material.dart';
import '../../models/blog/article.model.dart';
import '../../widgets/shared_assets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final int limit = 5;
  List<ArticleModel> paginatedArticles = [];

  Future<List<ArticleModel>> _fetchArticle(int currentPage, int limit) async {
    int offSet = (currentPage - 1) * limit;

    final paginatedArticles = articles.skip(offSet).take(limit).toList();

    return paginatedArticles;
  }

  @override
  void initState() {
    super.initState();
    _loadArticle();
  }

  Future<void> _loadArticle() async {
    final data = await _fetchArticle(currentPage, limit);
    setState(() {
      paginatedArticles = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern Samurai'),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 16),
            child: Stack(
              children: [
                CircleAvatar(child: Text("?")),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 8,
                    child: Icon(size: 13, Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(2),
            child: TextField(
              textInputAction: TextInputAction.search,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                hintText: "Search",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: paginatedArticles.isEmpty
                ? const Center(child: Text("No articles yet."))
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: paginatedArticles.length,
                    itemBuilder: (context, index) {
                      final article = paginatedArticles[index];

                      return Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(article.content),
                              const SizedBox(height: 8),

                              if (article.images != null &&
                                  article.images!.isNotEmpty)
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    article.images!.first.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "Published by ${article.fullName}",
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Text(" • "),
                                  Text(
                                    timeAgo(article.createdAt),
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          if (articles.isNotEmpty)
            Builder(
              builder: (context) {
                final limit = 5;
                final totalPages = (articles.length / limit).ceil();

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == 1)
                          ? null
                          : () async {
                              if (currentPage > 1) {
                                currentPage = 1;
                                await _loadArticle();
                              }
                            },
                      icon: Icon(Icons.first_page),
                    ),
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == 1)
                          ? null
                          : () async {
                              if (currentPage > 1) {
                                 currentPage--;
                                 await _loadArticle();
                              }
                            },
                      icon: Icon(Icons.chevron_left),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Text("Page $currentPage of $totalPages"),
                      ),
                    ),
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == totalPages)
                          ? null
                          : () async {
                              if (currentPage < totalPages) {
                                currentPage++;
                                await _loadArticle();
                              }
                            },
                      icon: Icon(Icons.chevron_right),
                    ),
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == totalPages)
                          ? null
                          : () async {
                              if (currentPage < totalPages) {
                                currentPage = totalPages;
                                await _loadArticle();
                              }
                            },
                      icon: Icon(Icons.last_page),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

// date to time/day converter
String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
  } else {
    return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
  }
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
