import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Media',
      subtitle: 'Videos & images: tutorials, parking instructions, promotions.',
      icon: Icons.video_library,
    );
  }
}