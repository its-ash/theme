import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:theme/theme.dart';
import 'agrisure_main_nav.dart';

class AgriSureApp extends StatelessWidget {
  const AgriSureApp({super.key});

  static final _seedScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF2E7D32),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriSure',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(
        colorScheme: _seedScheme,
        textTheme: GoogleFonts.poppinsTextTheme(AppTypography.lightTextTheme),
      ),
      home: const AgriSureMainNav(),
    );
  }
}
