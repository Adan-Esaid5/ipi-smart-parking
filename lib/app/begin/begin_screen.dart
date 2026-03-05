import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../i18n/app_locale.dart';
import '../i18n/strings.dart';
import '../theme/app_theme.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w900,
        );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: AppTheme.card,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(Icons.local_parking, color: AppTheme.yellow, size: 58),
              ),
              const SizedBox(height: 18),
              Text(S.t(context, 'IPI Smart Parking'), style: titleStyle),
              const SizedBox(height: 24),

              Text(
                S.t(context, 'choose_language'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LangButton(
                    label: 'ENG',
                    onTap: () {
                      AppLocale.setEnglish();
                      context.go('/home');
                    },
                  ),
                  const SizedBox(width: 12),
                  _LangButton(
                    label: 'HE',
                    onTap: () {
                      AppLocale.setHebrew();
                      context.go('/home');
                    },
                  ),
                  const SizedBox(width: 12),
                  _LangButton(
                    label: 'AR',
                    onTap: () {
                      AppLocale.setArabic();
                      context.go('/home');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _LangButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.yellow.withOpacity(0.25)),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
  }
}