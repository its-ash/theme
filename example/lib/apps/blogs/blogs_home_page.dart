import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'blogs_model.dart';
import 'post_detail_page.dart';

class BlogsHomePage extends StatelessWidget {
  const BlogsHomePage({
    super.key,
    required this.isBookmarked,
    required this.onToggleBookmark,
  });

  final bool Function(BlogPost post) isBookmarked;
  final ValueChanged<BlogPost> onToggleBookmark;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: BlogsData.posts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
          final post = BlogsData.posts[i];
          return ThemeCard(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailPage(
                    post: post,
                    isBookmarked: isBookmarked(post),
                    onToggleBookmark: () => onToggleBookmark(post),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThemeChip(label: post.category),
                        ThemeIconButton(
                          icon: isBookmarked(post) ? Icons.bookmark : Icons.bookmark_border,
                          onPressed: () => onToggleBookmark(post),
                        ),
                      ],
                    ),
                    ThemeText(post.title, ThemeFont.lato, ThemeFontSize.size18, weight: FontWeight.w700),
                    const SizedBox(height: 6),
                    ThemeText(post.excerpt, ThemeFont.lato, ThemeFontSize.size14),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ThemeText(
                          post.author,
                          ThemeFont.lato,
                          ThemeFontSize.size12,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.circle, size: 4, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)),
                        const SizedBox(width: 8),
                        ThemeText('${post.readTimeMinutes} min read', ThemeFont.lato, ThemeFontSize.size12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
