import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'GPS',
      subtitle: 'Detect your location and show nearby IPI parking lots.',
      icon: Icons.map,
    );
  }
}