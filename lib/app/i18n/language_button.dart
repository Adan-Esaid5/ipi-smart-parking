import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_locale.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: AppLocale.notifier,
      builder: (context, locale, _) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.language, color: AppTheme.yellow),
          onSelected: (value) {
            if (value == 'en') AppLocale.setEnglish();
            if (value == 'he') AppLocale.setHebrew();
            if (value == 'ar') AppLocale.setArabic();
          },
          itemBuilder: (context) => [
            _item('en', 'ENG', locale.languageCode == 'en'),
            _item('he', 'HE', locale.languageCode == 'he'),
            _item('ar', 'AR', locale.languageCode == 'ar'),
          ],
        );
      },
    );
  }

  PopupMenuItem<String> _item(String code, String label, bool selected) {
    return PopupMenuItem<String>(
      value: code,
      child: Row(
        children: [
          if (selected) const Icon(Icons.check, size: 18) else const SizedBox(width: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}