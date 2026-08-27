import 'package:flutter/material.dart';

import 'package:theme/theme.dart';
import 'launcher/app_launcher_page.dart';

void main() => runApp(const ShowcaseRoot());

class ShowcaseRoot extends StatelessWidget {
  const ShowcaseRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Showcase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: const AppLauncherPage(),
    );
  }
}
