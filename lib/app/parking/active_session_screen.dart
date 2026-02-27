import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/placeholder_page.dart';

class ActiveSessionScreen extends StatelessWidget {
  const ActiveSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(
      title: 'Active Parking Session',
      subtitle: 'Timer + live price calculation + Pay & Exit.',
      icon: Icons.timer,
      action: ElevatedButton(
        onPressed: () => context.go('/pelecard'),
        child: const Text('Pay now (Pelecard)'),
      ),
    );
  }
}