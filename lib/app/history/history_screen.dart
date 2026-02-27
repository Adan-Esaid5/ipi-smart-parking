import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'History',
      subtitle: 'All parking entries + payments per car plate.',
      icon: Icons.history,
    );
  }
}