import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data.dart';
import 'section_header.dart';

class SkillsSection extends StatelessWidget {
  final AppColors colors;

  const SkillsSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: c.bg,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(number: '04', title: 'SKILLS', colors: c),
          const SizedBox(height: 48),
          ...skillGroups.map((group) => _SkillGroupCard(
                group: group,
                colors: c,
              )),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  final SkillGroup group;
  final AppColors colors;

  const _SkillGroupCard({required this.group, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: c.accent,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: group.skills.map((skill) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: c.card2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: c.border),
                ),
                child: Text(
                  skill,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: c.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
