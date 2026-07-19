import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data.dart';
import 'section_header.dart';

class ExperienceSection extends StatelessWidget {
  final AppColors colors;

  const ExperienceSection({super.key, required this.colors});

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
          SectionHeader(number: '02', title: 'EXPERIENCE', colors: c),
          const SizedBox(height: 48),
          ...jobs.asMap().entries.map((entry) {
            final i = entry.key;
            final job = entry.value;
            return _JobCard(
              job: job,
              colors: c,
              isLast: i == jobs.length - 1,
            );
          }),
        ],
      ),
    );
  }
}

class _JobCard extends StatefulWidget {
  final JobData job;
  final AppColors colors;
  final bool isLast;

  const _JobCard({
    required this.job,
    required this.colors,
    required this.isLast,
  });

  @override
  State<_JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<_JobCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    final job = widget.job;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: c.accent,
                    shape: BoxShape.circle,
                    border: Border.all(color: c.bg, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: c.accent.withOpacity(0.4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      color: c.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Card
          Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: EdgeInsets.only(bottom: widget.isLast ? 0 : 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: c.card,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _hovered ? c.accent.withOpacity(0.4) : c.border,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: c.text,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                job.company,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: c.accent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: c.accent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                job.type,
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: c.accent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              job.period,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: c.muted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ...job.bullets.map((b) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 7),
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: c.accent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  b,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: c.muted,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
