import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class HeroSection extends StatefulWidget {
  final AppColors colors;
  final VoidCallback? onViewProjects;

  const HeroSection({super.key, required this.colors, this.onViewProjects});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _cursorController;
  late Animation<double> _floatAnim;
  late Animation<double> _cursorAnim;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    _cursorAnim = Tween<double>(begin: 1, end: 0.25).animate(_cursorController);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      child: Stack(
        children: [
          // Background radial glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    c.accent.withOpacity(c.isDark ? 0.08 : 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    c.accent2.withOpacity(c.isDark ? 0.06 : 0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: 60,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTextContent(c, isMobile),
                      const SizedBox(height: 48),
                      _buildPhoneMockup(c),
                      const SizedBox(height: 48),
                      _buildStats(c, isMobile),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 5, child: _buildTextContent(c, isMobile)),
                          Expanded(
                            flex: 4,
                            child: Center(child: _buildPhoneMockup(c)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      _buildStats(c, isMobile),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(AppColors c, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Badge
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        //   decoration: BoxDecoration(
        //     color: c.accent.withOpacity(0.12),
        //     borderRadius: BorderRadius.circular(20),
        //     border: Border.all(color: c.accent.withOpacity(0.3)),
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Container(
        //         width: 7,
        //         height: 7,
        //         decoration: BoxDecoration(
        //           color: c.accent,
        //           shape: BoxShape.circle,
        //         ),
        //       ),
        //       const SizedBox(width: 7),
        //       Text(
        //         'Available for new opportunities',
        //         style: GoogleFonts.inter(
        //           fontSize: 12,
        //           color: c.accent,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 20),
        // Name with cursor
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Flexible(
              child: Text(
                'Michael Osama',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: c.text,
                  height: 1.1,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _cursorAnim,
              builder: (context, _) => Opacity(
                opacity: _cursorAnim.value,
                child: Container(
                  width: 3,
                  height: isMobile ? 36 : 50,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: c.accent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Title
        Text(
          'Mobile Developer · Flutter Specialist',
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 16 : 20,
            fontWeight: FontWeight.w500,
            color: c.accent,
          ),
        ),
        const SizedBox(height: 16),
        // Description
        Text(
          'Crafting high-performance mobile experiences with Flutter. '
          '4+ years building production apps with 10K+ downloads, '
          'and serving government & enterprise clients.',
          style: GoogleFonts.inter(
            fontSize: 15,
            color: c.muted,
            height: 1.7,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 24),
        // CTA buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _CtaButton(
              label: 'View Projects',
              icon: Icons.arrow_forward_rounded,
              isPrimary: true,
              colors: c,
              onTap: () => widget.onViewProjects?.call(),
            ),
            _CtaButton(
              label: 'Get in Touch',
              icon: Icons.mail_outline_rounded,
              isPrimary: false,
              colors: c,
              onTap: () async {
                final uri = Uri.parse('mailto:maikl.osama39@gmail.com');
                if (await canLaunchUrl(uri)) await launchUrl(uri);
              },
            ),
            _CtaButton(
              label: 'WhatsApp',
              icon: Icons.chat_outlined,
              isPrimary: false,
              colors: c,
              onTap: () async {
                final uri = Uri.parse('https://wa.me/201286008357');
                if (await canLaunchUrl(uri)) await launchUrl(uri);
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Location
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined, size: 15, color: c.text),
            const SizedBox(width: 5),
            Text(
              'Cairo, Egypt',
              style: GoogleFonts.inter(fontSize: 13, color: c.text),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoneMockup(AppColors c) {
    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _floatAnim.value),
        child: child,
      ),
      child: Container(
        width: 210,
        height: 426,
        decoration: BoxDecoration(
          color: c.card,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: c.border, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: c.accent.withOpacity(0.15),
              blurRadius: 40,
              spreadRadius: -5,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status bar mock
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:41',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: c.text,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, size: 12, color: c.text),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 12, color: c.text),
                      const SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 12, color: c.text),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // App header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('🕋', style: TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rafeeq',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'رفيق',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hajj Companion App',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // 4 emoji tiles
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.6,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _PhoneTile(emoji: '🗺️', label: 'Guide', colors: c),
                  _PhoneTile(emoji: '📍', label: 'Location', colors: c),
                  _PhoneTile(emoji: '📅', label: 'Schedule', colors: c),
                  _PhoneTile(emoji: '🤲', label: 'Prayers', colors: c),
                ],
              ),
              const SizedBox(height: 10),
              // Action button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [c.accent, c.accent2],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Start Journey →',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Home indicator
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: c.faint,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats(AppColors c, bool isMobile) {
    final stats = [
      {'value': '50K+', 'label': 'App Downloads', 'icon': '📱'},
      {'value': '15+', 'label': 'Apps Launched', 'icon': '🚀'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stats
          .map((s) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  decoration: BoxDecoration(
                    color: c.card,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: c.border),
                  ),
                  child: Column(
                    children: [
                      Text(s['icon']!, style: const TextStyle(fontSize: 22)),
                      const SizedBox(height: 6),
                      Text(
                        s['value']!,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: c.accent,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        s['label']!,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: c.muted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _PhoneTile extends StatelessWidget {
  final String emoji;
  final String label;
  final AppColors colors;

  const _PhoneTile({
    required this.emoji,
    required this.label,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.card2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 9, color: colors.muted),
          ),
        ],
      ),
    );
  }
}

class _CtaButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final AppColors colors;
  final VoidCallback onTap;

  const _CtaButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.colors,
    required this.onTap,
  });

  @override
  State<_CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<_CtaButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: widget.isPrimary
              ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: [c.accent, c.accent2],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: _hovered
                      ? [
                          BoxShadow(
                            color: c.accent.withOpacity(0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : [],
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: c.border, width: 1.5),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isPrimary ? Colors.white : c.text,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                widget.icon,
                size: 16,
                color: widget.isPrimary ? Colors.white : c.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
