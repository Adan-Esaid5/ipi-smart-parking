import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Contact',
      subtitle: 'Open a ticket / send message to IPI support.',
      icon: Icons.support_agent,
    );
  }
}