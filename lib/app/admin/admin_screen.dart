import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Admin Panel',
      subtitle: 'Manage parking lots, prices, users, and reports.',
      icon: Icons.admin_panel_settings,
    );
  }
}