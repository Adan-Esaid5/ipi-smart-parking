import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // כרגע תמיד נשלח ל-Login
    // בהמשך: אם יש session מחובר -> Home
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _SplashBody(),
      ),
    );
  }
}

class _SplashBody extends StatelessWidget {
  const _SplashBody();

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w900,
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: AppTheme.card,
            borderRadius: BorderRadius.circular(26),
          ),
          child: const Icon(Icons.local_parking, color: AppTheme.yellow, size: 52),
        ),
        const SizedBox(height: 18),
        Text('IPI Smart Parking', style: title),
        const SizedBox(height: 8),
        Text(
          'Park • Track • Pay',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.text2),
        ),
        const SizedBox(height: 26),
        const SizedBox(
          width: 26,
          height: 26,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ],
    );
  }
}