import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'section_header.dart';

class AboutSection extends StatelessWidget {
  final AppColors colors;

  const AboutSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: c.bg2,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(number: '01', title: 'ABOUT ME', colors: c),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(c),
                    const SizedBox(height: 32),
                    _buildHighlights(c),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildText(c)),
                    const SizedBox(width: 48),
                    Expanded(flex: 2, child: _buildHighlights(c)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildText(AppColors c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a Mobile Developer based in Cairo, Egypt, specializing in Flutter. "
          "With 4+ years of experience, I've built and shipped production apps ranging from "
          "government platforms to consumer marketplaces — all with clean architecture, "
          "smooth UX, and reliable performance.",
          style: GoogleFonts.inter(
            fontSize: 15,
            color: c.muted,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I care deeply about code quality, scalable architecture, and the end-user experience. "
          "Whether it's integrating a payment gateway, implementing NFC, setting up CI/CD, or "
          "optimizing state management — I bring full ownership to every layer of the stack.",
          style: GoogleFonts.inter(
            fontSize: 15,
            color: c.muted,
            height: 1.8,
          ),
        ),
      ],
    );
  }

  Widget _buildHighlights(AppColors c) {
    final highlights = [
      {'icon': '📍', 'label': 'Location', 'value': 'Cairo, Egypt'},
      {'icon': '💼', 'label': 'Experience', 'value': '4+ Years'},
      {'icon': '🎯', 'label': 'Focus', 'value': 'Flutter & Mobile'},
      {'icon': '🌐', 'label': 'Languages', 'value': 'Arabic, English'},
    ];

    return Column(
      children: highlights.map((h) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: c.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: c.border),
          ),
          child: Row(
            children: [
              Text(h['icon']!, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    h['label']!,
                    style: GoogleFonts.inter(fontSize: 11, color: c.faint),
                  ),
                  Text(
                    h['value']!,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: c.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
