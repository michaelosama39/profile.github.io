import 'package:flutter/material.dart';
import 'theme.dart';
import 'sections/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  final AppColors colors;
  final VoidCallback onToggleTheme;

  const PortfolioPage({
    super.key,
    required this.colors,
    required this.onToggleTheme,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.colors;
    return Scaffold(
      backgroundColor: c.bg,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70), // nav offset
                HeroSection(
                  colors: c,
                  onViewProjects: () => _scrollToSection(_projectsKey),
                ),
                AboutSection(key: _aboutKey, colors: c),
                ExperienceSection(key: _experienceKey, colors: c),
                ProjectsSection(key: _projectsKey, colors: c),
                SkillsSection(key: _skillsKey, colors: c),
                EducationSection(colors: c),
                ContactSection(key: _contactKey, colors: c),
              ],
            ),
          ),
          NavBar(
            colors: c,
            onToggleTheme: widget.onToggleTheme,
            onNavTap: (section) {
              switch (section) {
                case 'About':
                  _scrollToSection(_aboutKey);
                  break;
                case 'Experience':
                  _scrollToSection(_experienceKey);
                  break;
                case 'Projects':
                  _scrollToSection(_projectsKey);
                  break;
                case 'Skills':
                  _scrollToSection(_skillsKey);
                  break;
                case 'Contact':
                  _scrollToSection(_contactKey);
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
