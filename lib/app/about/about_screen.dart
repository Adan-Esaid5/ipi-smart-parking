import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'About',
      subtitle: 'About IPI, privacy policy, terms, app version.',
      icon: Icons.info_outline,
    );
  }
}