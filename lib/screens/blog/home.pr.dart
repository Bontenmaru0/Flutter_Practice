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
            child: articles.isEmpty
                ? const Center(child: Text("No articles yet."))
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];

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
                          : () {
                              if (currentPage > 1) {
                                setState(() => currentPage = 1);
                              }
                            },
                      icon: Icon(Icons.first_page),
                    ),
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == 1)
                          ? null
                          : () {
                              if (currentPage > 1) {
                                setState(() => currentPage--);
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
                          : () {
                              if (currentPage < totalPages) {
                                setState(() => currentPage++);
                              }
                            },
                      icon: Icon(Icons.chevron_right),
                    ),
                    IconButton(
                      onPressed: (articles.isEmpty || currentPage == totalPages)
                          ? null
                          : () {
                              if (currentPage < totalPages) {
                                setState(() => currentPage = totalPages);
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
