import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/placeholder_page.dart';

class ParkingLotsScreen extends StatelessWidget {
  const ParkingLotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(
      title: 'IPI Parking Lots',
      subtitle: 'List of IPI parking lots from the database.',
      icon: Icons.local_parking,
      action: ElevatedButton(
        onPressed: () => context.go('/parking-details/1'),
        child: const Text('Open example parking details'),
      ),
    );
  }
}