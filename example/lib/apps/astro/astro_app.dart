import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:theme/theme.dart';
import 'astro_main_nav.dart';

class AstroApp extends StatelessWidget {
  const AstroApp({super.key});

  static final _astroScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6A1B9A),
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme(
        colorScheme: _astroScheme,
        textTheme: GoogleFonts.playfairDisplayTextTheme(AppTypography.darkTextTheme),
      ),
      home: const AstroMainNav(),
    );
  }
}
