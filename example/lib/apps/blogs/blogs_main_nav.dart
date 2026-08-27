import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'blogs_drawer.dart';
import 'blogs_home_page.dart';
import 'blogs_model.dart';
import 'blogs_settings_page.dart';
import 'bookmarks_page.dart';

class BlogsMainNav extends StatefulWidget {
  const BlogsMainNav({super.key});

  @override
  State<BlogsMainNav> createState() => _BlogsMainNavState();
}

class _BlogsMainNavState extends State<BlogsMainNav> {
  int _index = 0;
  final Set<String> _bookmarkedTitles = {};

  static const _titles = ['Blogs', 'Bookmarks', 'Settings'];

  void _navTo(int index) => setState(() => _index = index);

  bool _isBookmarked(BlogPost post) => _bookmarkedTitles.contains(post.title);

  void _toggleBookmark(BlogPost post) {
    setState(() {
      if (!_bookmarkedTitles.add(post.title)) {
        _bookmarkedTitles.remove(post.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookmarks = BlogsData.posts.where(_isBookmarked).toList();
    return Scaffold(
      appBar: ThemeAppBar(title: _titles[_index]),
      drawer: BlogsDrawer(onNavigate: _navTo),
      body: IndexedStack(
        index: _index,
        children: [
          BlogsHomePage(isBookmarked: _isBookmarked, onToggleBookmark: _toggleBookmark),
          BookmarksPage(bookmarks: bookmarks, onToggleBookmark: _toggleBookmark),
          const BlogsSettingsPage(),
        ],
      ),
      bottomNavigationBar: ThemeNavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _navTo,
        destinations: const [
          ThemeNavigationDestinationItem(icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
          ThemeNavigationDestinationItem(icon: Icons.bookmark_border, selectedIcon: Icons.bookmark, label: 'Bookmarks'),
          ThemeNavigationDestinationItem(icon: Icons.settings_outlined, selectedIcon: Icons.settings, label: 'Settings'),
        ],
      ),
    );
  }
}
