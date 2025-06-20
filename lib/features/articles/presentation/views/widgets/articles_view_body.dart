import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/features/articles/data/models/article.dart';
import 'package:health_guard/features/articles/data/static/articles_list.dart';
import 'package:health_guard/features/articles/presentation/views/screens/article_detail_screen.dart';

/// Screen that displays a searchable list of health articles
class ArticleViewBody extends StatefulWidget {
  const ArticleViewBody({super.key});

  @override
  State<ArticleViewBody> createState() => _ArticleViewBodyState();
}

class _ArticleViewBodyState extends State<ArticleViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Article data repository - in a real app, this would come from a service
  final ArticleRepository _articleRepository = ArticleRepository();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  // Get filtered articles based on search query
  List<Article> get _filteredArticles {
    return _articleRepository.getFilteredArticles(_searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              Expanded(
                child: _buildArticlesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header with title
  Widget _buildHeader() {
    return const Center(
      child: Text(
        AppString.articles,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.bodyColor,
        ),
      ),
    );
  }

  // Search bar with clear functionality
  Widget _buildSearchBar() {
    return SearchBar(
      controller: _searchController,
      onClear: () => _searchController.clear(),
      hintText: AppString.search,
    );
  }

  // Article list or empty state
  Widget _buildArticlesList() {
    final articles = _filteredArticles;

    if (articles.isEmpty) {
      return EmptySearchResult(searchQuery: _searchQuery);
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 180,
          child: ArticleCard(
            article: articles[index],
            onTap: () => _navigateToArticleDetail(context, articles[index]),
          ),
        );
      },
    );
  }

  // Navigate to article detail screen
  void _navigateToArticleDetail(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(article: article),
      ),
    );
  }
}

/// Custom search bar widget
class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;
  final String hintText;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onClear,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.subColor,
          width: 1.0,
        ),
      ),
      child: TextField(
        cursorColor: AppColor.bodyColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search, color: AppColor.subColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: AppColor.subColor),
                  onPressed: onClear,
                )
              : null,
        ),
      ),
    );
  }
}

/// Widget displayed when no search results are found
class EmptySearchResult extends StatelessWidget {
  final String searchQuery;

  const EmptySearchResult({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off,
            size: 64,
            color: AppColor.subColor,
          ),
          const SizedBox(height: 16),
          Text(
            'No articles found for "$searchQuery"',
            style: const TextStyle(
              fontSize: 16,
              color: AppColor.bodyColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Try different keywords or browse all articles',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.subColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Card widget for displaying article preview
class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColor.grey,
                width: 2.0,
              )),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildArticleImage(),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildArticleContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArticleImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        article.image,
        width: 100,
        height: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 100,
            height: 100,
            color: AppColor.grey,
            child: const Icon(Icons.image, color: Colors.grey),
          );
        },
      ),
    );
  }

  Widget _buildArticleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.bodyColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.description,
          style: const TextStyle(
            fontSize: 16,
            color: AppColor.subColor,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Repository class for managing article data
class ArticleRepository {
  // Get all articles
  List<Article> getAllArticles() {
    return articles;
  }

  // Get filtered articles based on search query
  List<Article> getFilteredArticles(String query) {
    if (query.isEmpty) {
      return articles;
    }

    final lowercaseQuery = query.toLowerCase();
    return articles.where((article) {
      return article.title.toLowerCase().contains(lowercaseQuery) ||
          article.description.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  // Get article by ID
  Article? getArticleById(String id) {
    try {
      return articles.firstWhere((article) => article.id == id);
    } catch (e) {
      return null;
    }
  }
}
