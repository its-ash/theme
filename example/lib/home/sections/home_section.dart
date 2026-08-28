import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:theme/theme.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  // Cached at the type level (not per-State) so navigating away from Home
  // and back doesn't re-read the asset or re-parse the markdown — the
  // section's State is torn down and recreated on every tab switch since
  // ShowcaseHomePage only builds the currently-selected section.
  static Future<String>? _readmeCache;

  Future<String> _loadReadme() {
    return _readmeCache ??= rootBundle.loadString('assets/README.md').then((content) {
      if (content.trim().isEmpty) {
        throw StateError(
          'assets/README.md is empty — the symlink to the root README.md was likely not '
          'preserved by this checkout (see `make check-assets`).',
        );
      }
      return content;
    }).catchError((Object error) {
      // Don't cache a failed load — a later fix to the checkout (or a hot
      // restart after `make check-assets` catches it) should retry.
      _readmeCache = null;
      throw error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadReadme(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.hasError) {
            return ThemeErrorState(
              title: 'Could not load README',
              subtitle: '${snapshot.error}',
            );
          }
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              children: [
                ThemeMarkdown(data: snapshot.data!),
              ],
            ),
          ),
        );
      },
    );
  }
}
