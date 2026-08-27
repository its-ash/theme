import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:theme/theme.dart';
import 'blogs_main_nav.dart';

class BlogsApp extends StatelessWidget {
  const BlogsApp({super.key});

  static final _blogsScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFEF6C00),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(
        colorScheme: _blogsScheme,
        textTheme: GoogleFonts.merriweatherTextTheme(AppTypography.lightTextTheme),
      ),
      home: const BlogsMainNav(),
    );
  }
}
