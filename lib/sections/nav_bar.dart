import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class NavBar extends StatefulWidget {
  final AppColors colors;
  final VoidCallback onToggleTheme;
  final void Function(String section) onNavTap;

  const NavBar({
    super.key,
    required this.colors,
    required this.onToggleTheme,
    required this.onNavTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? _hoveredLink;

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: c.bg.withOpacity(0.92),
          border: Border(
            bottom: BorderSide(color: c.border, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // Logo
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [c.accent, c.accent2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'M',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Michael Osama',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: c.text,
                ),
              ),
              const Spacer(),
              if (!isMobile) ...[
                for (final label in ['About', 'Experience', 'Projects', 'Skills', 'Contact'])
                  _NavLink(
                    label: label,
                    colors: c,
                    isHovered: _hoveredLink == label,
                    onHover: (h) => setState(() => _hoveredLink = h ? label : null),
                    onTap: () => widget.onNavTap(label),
                  ),
                const SizedBox(width: 12),
              ],
              // Theme toggle
              _IconBtn(
                tooltip: c.isDark ? 'Switch to light mode' : 'Switch to dark mode',
                colors: c,
                onTap: widget.onToggleTheme,
                child: Text(
                  c.isDark ? '☀' : '☾',
                  style: TextStyle(fontSize: 16, color: c.muted),
                ),
              ),
              const SizedBox(width: 8),
              // CV Download
              GestureDetector(
                onTap: () async {
                  final uri = Uri.parse(
                      'https://drive.google.com/file/d/1YZxItbbTTG0AsX3ThYUHHgGO3M9VZ0wa/view?usp=sharing');
                  if (await canLaunchUrl(uri)) await launchUrl(uri);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: c.accent, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.download_rounded, size: 15, color: c.accent),
                      const SizedBox(width: 5),
                      Text(
                        'CV',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: c.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final AppColors colors;
  final bool isHovered;
  final void Function(bool) onHover;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.colors,
    required this.isHovered,
    required this.onHover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isHovered ? colors.accent : colors.muted,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final String tooltip;
  final AppColors colors;
  final Widget child;
  final VoidCallback onTap;

  const _IconBtn({
    required this.tooltip,
    required this.colors,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.border),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
