import 'package:flutter/material.dart';

class JobData {
  final String title;
  final String company;
  final String type;
  final String period;
  final List<String> bullets;

  const JobData({
    required this.title,
    required this.company,
    required this.type,
    required this.period,
    required this.bullets,
  });
}

class ProjectLink {
  final String label;
  final String url;

  const ProjectLink({required this.label, required this.url});
}

class ProjectData {
  final String name;
  final String nameAr;
  final String emoji;
  final String category;
  final String description;
  final List<ProjectLink> links;
  final List<Color> gradient;

  const ProjectData({
    required this.name,
    required this.nameAr,
    required this.emoji,
    required this.category,
    required this.description,
    required this.links,
    required this.gradient,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;

  const SkillGroup({required this.title, required this.skills});
}

const List<JobData> jobs = [
  JobData(
    title: 'Mobile Developer',
    company: 'Safa Soft Company',
    type: 'Hybrid',
    period: 'Mar 2025 – Present',
    bullets: [
      'Egyptian Umrah Portal (umrah.eg) — government platform regulating Umrah travel',
      'Agile / Scrum development methodologies',
    ],
  ),
  JobData(
    title: 'Flutter Developer',
    company: 'AAIT Company',
    type: 'Onsite',
    period: 'Feb 2023 – Feb 2025',
    bullets: [
      'Launched multiple apps achieving 10K+ downloads and 4.5+ star ratings',
      'Mentored teammates and drove knowledge sharing through code reviews',
      'CI/CD (Fastlane, GitHub Actions), Method Channel, payment integration, state management (Provider/Bloc/Riverpod/GetX), Git/GitLab, unit testing',
    ],
  ),
  JobData(
    title: 'Junior Flutter Developer',
    company: 'Deltawy Company',
    type: 'Onsite',
    period: 'Mar 2022 – Jan 2023',
    bullets: [
      'Firebase Auth, Cloud Messaging, Cloud Firestore',
      'Offline storage (Hive, SharedPreferences); REST/JSON & third-party API integration',
      'Responsive / adaptive UI and mobile design patterns',
    ],
  ),
  JobData(
    title: 'Android Developer Intern',
    company: 'Ipda3 tac Company',
    type: 'Internship',
    period: 'Jan 2020 – Mar 2021',
    bullets: [
      'Native Android development (Java, Kotlin)',
      'Dependency injection (Dagger), reactive programming (Coroutines)',
    ],
  ),
];

const List<ProjectData> projects = [
  ProjectData(
    name: 'Rafeeq',
    nameAr: 'رفيق',
    emoji: '🕋',
    category: 'Gov · Tourism',
    description:
        'A smart digital companion developed under the Egyptian Ministry of Tourism to assist pilgrims throughout their Hajj journey, providing comprehensive guidance for rituals, prayers, fatwas, prayer time notifications, trip management, and direct communication channels for feedback and support.',
    links: [
      ProjectLink(
        label: 'Hajj · Google Play',
        url: 'https://play.google.com/store/apps/details?id=com.safa.rafeeq.app',
      ),
      ProjectLink(
        label: 'Supervisor · Google Play',
        url: 'https://play.google.com/store/apps/details?id=com.safa.rafeeq.supervisor.app',
      ),
      ProjectLink(
        label: 'Hajj · App Store',
        url: 'https://apps.apple.com/us/app/rafeeq-%D8%B1%D9%81%D9%8A%D9%82/id6766878861',
      ),
      ProjectLink(
        label: 'Supervisor · App Store',
        url: 'https://apps.apple.com/us/app/rafeeq-supervisor-%D8%B1%D9%81%D9%8A%D9%82-%D8%A7%D9%84%D8%A5%D8%B4%D8%B1%D8%A7%D9%81/id6767191449',
      ),
    ],
    gradient: [Color(0xFF38BDF8), Color(0xFF0284C7)],
  ),
  ProjectData(
    name: 'Beauté',
    nameAr: 'بيوتي',
    emoji: '💄',
    category: 'Consumer',
    description:
        'Beauté is your go-to platform for discovering and booking beauty services, connecting clients with professional makeup artists and beauty experts in a few simple steps.',
    links: [
      ProjectLink(
          label: 'Customer · Google Play',
          url: 'https://play.google.com/store/apps/details?id=com.aait.flutter.beauteCustomer'),
      ProjectLink(
          label: 'Provider · Google Play',
          url: 'https://play.google.com/store/apps/details?id=com.aait.flutter.beauteProvider'),
    ],
    gradient: [Color(0xFFF472B6), Color(0xFFA855F7)],
  ),
  ProjectData(
    name: 'Mrsoom',
    nameAr: 'مرسوم',
    emoji: '🐑',
    category: 'Marketplace',
    description:
        'Marsoom is your reliable digital platform for arranging and managing sacrificial offerings with ease and trust.',
    links: [
      ProjectLink(
          label: 'Google Play',
          url: 'https://play.google.com/store/apps/details?id=sa.aait.php.mrsoom'),
      ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/eg/app/%D9%85%D8%B1%D8%B3%D9%88%D9%85/id1541744793'),
    ],
    gradient: [Color(0xFF34D399), Color(0xFF059669)],
  ),
  ProjectData(
    name: 'D-Bikes',
    nameAr: 'دي-بايكس',
    emoji: '🏍️',
    category: 'Marketplace',
    description:
        'A specialized platform for buying and selling new and used motorcycles, bicycles, marine tanks, boats, yachts, and all related spare parts and accessories.',
    links: [
      ProjectLink(
          label: 'Google Play',
          url: 'https://play.google.com/store/apps/details?id=sa.aait.flutter.dbikes'),
      ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/eg/app/d-bikes/id1662258319'),
    ],
    gradient: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
  ),
  ProjectData(
    name: 'Souq Al Anam',
    nameAr: 'سوق الأنعام',
    emoji: '🐐',
    category: 'Marketplace',
    description:
        'Developed Souq Al Anam, a mobile marketplace app for livestock trading, featuring advanced filtering, categorized listings, search functionality, and a user-friendly interface.',
    links: [
      ProjectLink(
          label: 'Google Play',
          url: 'https://play.google.com/store/apps/details?id=com.aait.flutter.suq.alianeam'),
    ],
    gradient: [Color(0xFFA3E635), Color(0xFF65A30D)],
  ),
  ProjectData(
    name: 'Moraqeb',
    nameAr: 'مراقب',
    emoji: '🛡️',
    category: 'Gov · KSA',
    description:
        'This application serves as a monitor to control and prove the violations listed in the table of groups of violations and penalties.',
    links: [
      ProjectLink(label: 'Enterprise', url: ''),
    ],
    gradient: [Color(0xFF818CF8), Color(0xFF4F46E5)],
  ),
  ProjectData(
    name: 'Switch (NFC Read/Write)',
    nameAr: '',
    emoji: '📡',
    category: 'R&D',
    description: 'Designed NFC tag functionality, resulting in a 30% increase in user engagement.',
    links: [
      ProjectLink(label: 'NFC', url: ''),
    ],
    gradient: [Color(0xFF22D3EE), Color(0xFF0891B2)],
  ),
];

const List<SkillGroup> skillGroups = [
  SkillGroup(
    title: 'Languages',
    skills: ['Dart', 'Java', 'Kotlin', 'C++', 'C#', 'XML'],
  ),
  SkillGroup(
    title: 'Frameworks & Tools',
    skills: ['Flutter', 'Fastlane', 'GitHub Actions', 'Git/GitLab'],
  ),
  SkillGroup(
    title: 'State Management',
    skills: ['Bloc', 'Provider', 'Riverpod', 'GetX'],
  ),
  SkillGroup(
    title: 'Backend & Services',
    skills: ['Firebase Auth', 'Cloud Messaging', 'Firestore', 'REST/JSON'],
  ),
  SkillGroup(
    title: 'Other',
    skills: [
      'CI/CD',
      'Unit Testing',
      'Design Patterns',
      'Method Channel',
      'Payment Integration',
      'NFC',
    ],
  ),
];
