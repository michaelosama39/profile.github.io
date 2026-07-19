import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import 'section_header.dart';

class ContactSection extends StatelessWidget {
  final AppColors colors;

  const ContactSection({super.key, required this.colors});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final c = colors;
    final isMobile = MediaQuery.of(context).size.width < 768;

    final contactItems = [
      {
        'icon': Icons.email_outlined,
        'label': 'Email',
        'value': 'maikl.osama39@gmail.com',
        'url': 'mailto:maikl.osama39@gmail.com',
        'gradient': [const Color(0xFF38BDF8), const Color(0xFF0284C7)],
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Phone',
        'value': '0128 600 8357',
        'url': 'tel:+201286008357',
        'gradient': [const Color(0xFF34D399), const Color(0xFF059669)],
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Phone 2',
        'value': '0102 371 5184',
        'url': 'tel:+201023715184',
        'gradient': [const Color(0xFF34D399), const Color(0xFF059669)],
      },
    ];

    final socials = [
      {
        'label': 'LinkedIn',
        'icon': '🔗',
        'url': 'https://linkedin.com/in/michael-osama',
        'gradient': [const Color(0xFF0284C7), const Color(0xFF0891B2)],
      },
      {
        'label': 'GitHub',
        'icon': '🐙',
        'url': 'https://github.com/michael-osama',
        'gradient': [const Color(0xFF818CF8), const Color(0xFF4F46E5)],
      },
      {
        'label': 'WhatsApp',
        'icon': '💬',
        'url': 'https://wa.me/201286008357',
        'gradient': [const Color(0xFF34D399), const Color(0xFF059669)],
      },
      {
        'label': 'Google',
        'icon': '👨‍💻',
        'url': 'mailto:maikl.osama39@gmail.com',
        'gradient': [const Color(0xFFF472B6), const Color(0xFFA855F7)],
      },
    ];

    return Container(
      width: double.infinity,
      color: c.bg,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(number: '06', title: 'CONTACT', colors: c),
                const SizedBox(height: 16),
                Text(
                  "Have a project in mind? Let's build something great together.",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: c.muted,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                isMobile
                    ? Column(
                        children: [
                          _buildContactItems(c, contactItems, isMobile),
                          const SizedBox(height: 24),
                          _buildSocials(c, socials, isMobile),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: _buildContactItems(
                                  c, contactItems, isMobile)),
                          const SizedBox(width: 32),
                          Expanded(
                              child: _buildSocials(c, socials, isMobile)),
                        ],
                      ),
              ],
            ),
          ),
          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            decoration: BoxDecoration(
              color: c.bg2,
              border: Border(top: BorderSide(color: c.border)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [c.accent, c.accent2],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'M',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Michael Osama',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: c.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Mobile Developer · Flutter Specialist · Cairo, Egypt',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: c.faint,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '© ${DateTime.now().year} Michael Osama. Built with Flutter.',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: c.faint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItems(
    AppColors c,
    List<Map<String, dynamic>> items,
    bool isMobile,
  ) {
    return Column(
      children: items.map((item) {
        final gradColors = item['gradient'] as List<Color>;
        return _ContactItem(
          icon: item['icon'] as IconData,
          label: item['label'] as String,
          value: item['value'] as String,
          gradient: gradColors,
          colors: c,
          onTap: () => _launch(item['url'] as String),
        );
      }).toList(),
    );
  }

  Widget _buildSocials(
    AppColors c,
    List<Map<String, dynamic>> socials,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: c.text,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: socials.map((s) {
            final gradColors = s['gradient'] as List<Color>;
            return _SocialChip(
              label: s['label'] as String,
              emoji: s['icon'] as String,
              gradient: gradColors,
              colors: c,
              onTap: () => _launch(s['url'] as String),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<Color> gradient;
  final AppColors colors;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.gradient,
    required this.colors,
    required this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
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
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: c.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? widget.gradient.first.withOpacity(0.5)
                  : c.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(widget.icon, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: c.faint,
                      ),
                    ),
                    Text(
                      widget.value,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: c.text,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: c.faint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialChip extends StatefulWidget {
  final String label;
  final String emoji;
  final List<Color> gradient;
  final AppColors colors;
  final VoidCallback onTap;

  const _SocialChip({
    required this.label,
    required this.emoji,
    required this.gradient,
    required this.colors,
    required this.onTap,
  });

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.gradient.first.withOpacity(0.12)
                : c.card,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? widget.gradient.first.withOpacity(0.4)
                  : c.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.emoji, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _hovered ? widget.gradient.first : c.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
