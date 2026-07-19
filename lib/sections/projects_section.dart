import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import '../data.dart';
import 'section_header.dart';

class ProjectsSection extends StatelessWidget {
  final AppColors colors;

  const ProjectsSection({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final c = colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final crossAxisCount = isMobile ? 1 : (screenWidth < 1100 ? 2 : 3);

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
          SectionHeader(number: '03', title: 'PROJECTS', colors: c),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 1.4 : 1.3,
            ),
            itemCount: projects.length,
            itemBuilder: (_, i) => _ProjectCard(
              project: projects[i],
              colors: c,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectData project;
  final AppColors colors;

  const _ProjectCard({required this.project, required this.colors});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: c.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? p.gradient.first.withOpacity(0.5) : c.border,
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: p.gradient.first.withOpacity(0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: p.gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(p.emoji, style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              p.name,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: c.text,
                              ),
                            ),
                            if (p.nameAr.isNotEmpty) ...[
                              const SizedBox(width: 6),
                              Text(
                                p.nameAr,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: c.muted,
                                ),
                              ),
                            ],
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: p.gradient.first.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            p.category,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: p.gradient.first,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                p.description,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: c.muted,
                  height: 1.6,
                ),
              ),
              const Spacer(),
              // Link badges
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: p.links.map((link) {
                  final hasUrl = link.url.isNotEmpty;
                  return MouseRegion(
                    cursor: hasUrl
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.basic,
                    child: GestureDetector(
                      onTap: hasUrl
                          ? () async {
                              final uri = Uri.parse(link.url);
                              if (await canLaunchUrl(uri)) launchUrl(uri);
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 4),
                        decoration: BoxDecoration(
                          color: c.card2,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: c.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getLinkIcon(link.label),
                              size: 11,
                              color: p.gradient.first,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              link.label,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: p.gradient.first,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getLinkIcon(String label) {
    final l = label.toLowerCase();
    if (l.contains('play')) return Icons.android_rounded;
    if (l.contains('store')) return Icons.apple_rounded;
    if (l.contains('enterprise')) return Icons.business_rounded;
    if (l.contains('nfc')) return Icons.nfc_rounded;
    return Icons.open_in_new_rounded;
  }
}
