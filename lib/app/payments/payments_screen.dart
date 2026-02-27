import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/placeholder_page.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(
      title: 'Payments',
      subtitle: 'View payment status, receipts, and start a payment.',
      icon: Icons.payment,
      action: ElevatedButton(
        onPressed: () => context.go('/pelecard'),
        child: const Text('Go to Checkout'),
      ),
    );
  }
}