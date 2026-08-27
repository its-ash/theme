import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'blogs_model.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    super.key,
    required this.post,
    required this.isBookmarked,
    required this.onToggleBookmark,
  });

  final BlogPost post;
  final bool isBookmarked;
  final VoidCallback onToggleBookmark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(
        title: 'Article',
        actions: [
          ThemeIconButton(
            icon: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            onPressed: onToggleBookmark,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ThemeChip(label: post.category),
          const SizedBox(height: 12),
          ThemeText(post.title, ThemeFont.lato, ThemeFontSize.size28, weight: FontWeight.w700),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                child: Icon(Icons.person, size: 18, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(width: 8),
              ThemeText(post.author, ThemeFont.lato, ThemeFontSize.size14, weight: FontWeight.w600),
              const SizedBox(width: 8),
              ThemeText('· ${post.readTimeMinutes} min read', ThemeFont.lato, ThemeFontSize.size14),
            ],
          ),
          const SizedBox(height: 20),
          const ThemeDivider(),
          const SizedBox(height: 20),
          ThemeText(post.content, ThemeFont.lato, ThemeFontSize.size16),
        ],
      ),
    );
  }
}
