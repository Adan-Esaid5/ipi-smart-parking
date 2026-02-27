import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w900,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => context.go('/admin'),
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Admin',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IPI Smart Parking', style: titleStyle),
            const SizedBox(height: 6),
            Text(
              'Modern Dark + Yellow UI ✅',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.text2),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: const [
                  _HomeCard(icon: Icons.timer, title: 'Active parking', route: '/active-session'),
                  _HomeCard(icon: Icons.local_parking, title: 'IPI parking lots', route: '/parking-lots'),
                  _HomeCard(icon: Icons.map, title: 'GPS', route: '/gps'),
                  _HomeCard(icon: Icons.payment, title: 'Payments', route: '/payments'),
                  _HomeCard(icon: Icons.history, title: 'History', route: '/history'),
                  _HomeCard(icon: Icons.video_library, title: 'Media', route: '/media'),
                  _HomeCard(icon: Icons.support_agent, title: 'Contact', route: '/contact'),
                  _HomeCard(icon: Icons.info_outline, title: 'About', route: '/about'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const _HomeCard({required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => context.go(route),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 34, color: AppTheme.yellow),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                'Open',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.text2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}