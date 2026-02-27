import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class PelecardCheckoutScreen extends StatelessWidget {
  const PelecardCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Pelecard Checkout',
      subtitle: 'Here we will open the secure Pelecard payment flow.',
      icon: Icons.lock,
    );
  }
}