import 'package:flutter/material.dart';
import '../shared/placeholder_page.dart';

class ParkingDetailsScreen extends StatelessWidget {
  final String parkingId;
  const ParkingDetailsScreen({super.key, required this.parkingId});

  @override
  Widget build(BuildContext context) {
    return PlaceholderPage(
      title: 'Parking Details',
      subtitle: 'Parking ID: $parkingId • prices • hours • navigation.',
      icon: Icons.info_outline,
    );
  }
}