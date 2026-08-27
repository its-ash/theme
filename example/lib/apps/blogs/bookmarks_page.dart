import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'blogs_model.dart';
import 'post_detail_page.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({
    super.key,
    required this.bookmarks,
    required this.onToggleBookmark,
  });

  final List<BlogPost> bookmarks;
  final ValueChanged<BlogPost> onToggleBookmark;

  @override
  Widget build(BuildContext context) {
    return bookmarks.isEmpty
        ? Center(
            child: ThemeText(
              'No bookmarks yet',
              ThemeFont.lato,
              ThemeFontSize.size16,
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: bookmarks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final post = bookmarks[i];
              return ThemeCard(
                child: ThemeListTile(
                  title: post.title,
                  subtitle: '${post.author} · ${post.readTimeMinutes} min read',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailPage(
                        post: post,
                        isBookmarked: true,
                        onToggleBookmark: () => onToggleBookmark(post),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
