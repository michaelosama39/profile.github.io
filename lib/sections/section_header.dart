import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final AppColors colors;

  const SectionHeader({
    super.key,
    required this.number,
    required this.title,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              number,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: c.accent,
              ),
            ),
            const SizedBox(width: 10),
            Container(width: 32, height: 1.5, color: c.accent),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: c.text,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
