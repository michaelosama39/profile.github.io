import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';
import 'portfolio_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDark = true;

  void _toggleTheme() {
    setState(() => _isDark = !_isDark);
  }

  @override
  Widget build(BuildContext context) {
    final colors = _isDark ? AppColors.dark : AppColors.light;
    return MaterialApp(
      title: 'Michael Osama — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.accent,
          brightness: _isDark ? Brightness.dark : Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(
          _isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
        ),
        scaffoldBackgroundColor: colors.bg,
        useMaterial3: true,
      ),
      home: PortfolioPage(
        colors: colors,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
