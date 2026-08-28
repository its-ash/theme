import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:theme/theme.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  late final Future<String> _readme = rootBundle.loadString('assets/README.md');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _readme,
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
