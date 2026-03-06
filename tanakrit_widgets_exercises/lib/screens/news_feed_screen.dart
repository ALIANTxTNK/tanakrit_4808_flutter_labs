import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../utils/responsive.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildArticleCard(context, articles[index]),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context, int columnCount) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _buildArticleCard(context, articles[index]);
      },
    );
  }

  Widget _buildArticleCard(BuildContext context, Article article) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: textTheme.titleLarge?.copyWith(color: colors.primary),
            ),
            const SizedBox(height: 8),

            Text(
              article.description,
              style: textTheme.bodyMedium?.copyWith(color: colors.onSurface),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.date,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                Text(
                  "${article.readingTimeMinutes} min read",
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Feed"), centerTitle: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columnCount = Responsive.getColumnCount(width);

            if (Responsive.isMobile(context)) {
              return _buildListView(context);
            } else {
              return _buildGridView(context, columnCount);
            }
          },
        ),
      ),
    );
  }
}

const List<Article> articles = [
  Article(
    title: 'Introduction to Flutter',
    description: 'Learn the basics of Flutter development...',
    date: '2024-01-05',
    readingTimeMinutes: 5,
  ),
  Article(
    title: 'Advanced Widget Patterns',
    description: 'Discover advanced patterns in Flutter...',
    date: '2024-01-04',
    readingTimeMinutes: 8,
  ),
  Article(
    title: 'State Management in Flutter',
    description: 'Explore different state management approaches...',
    date: '2024-01-03',
    readingTimeMinutes: 12,
  ),
  Article(
    title: 'Building Responsive UIs',
    description: 'Create apps that work on any screen size...',
    date: '2024-01-02',
    readingTimeMinutes: 10,
  ),
];
