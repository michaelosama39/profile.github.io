import 'package:flutter/material.dart';

class AppColors {
  final Color bg;
  final Color bg2;
  final Color card;
  final Color card2;
  final Color border;
  final Color text;
  final Color muted;
  final Color faint;
  final Color accent;
  final Color accent2;
  final bool isDark;

  const AppColors({
    required this.bg,
    required this.bg2,
    required this.card,
    required this.card2,
    required this.border,
    required this.text,
    required this.muted,
    required this.faint,
    required this.accent,
    required this.accent2,
    required this.isDark,
  });

  static const dark = AppColors(
    bg: Color(0xFF0F172A),
    bg2: Color(0xFF1E293B),
    card: Color(0xFF1E293B),
    card2: Color(0xFF334155),
    border: Color(0xFF334155),
    text: Color(0xFFF1F5F9),
    muted: Color(0xFF94A3B8),
    faint: Color(0xFF475569),
    accent: Color(0xFF38BDF8),
    accent2: Color(0xFF818CF8),
    isDark: true,
  );

  static const light = AppColors(
    bg: Color(0xFFF8FAFC),
    bg2: Color(0xFFF1F5F9),
    card: Color(0xFFFFFFFF),
    card2: Color(0xFFF1F5F9),
    border: Color(0xFFE2E8F0),
    text: Color(0xFF0F172A),
    muted: Color(0xFF64748B),
    faint: Color(0xFF94A3B8),
    accent: Color(0xFF0284C7),
    accent2: Color(0xFF4F46E5),
    isDark: false,
  );
}
