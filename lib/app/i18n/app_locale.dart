import 'package:flutter/material.dart';

class AppLocale {
  static final ValueNotifier<Locale> notifier = ValueNotifier(const Locale('en'));

  static void setLocale(Locale locale) => notifier.value = locale;

  static void setEnglish() => setLocale(const Locale('en'));
  static void setHebrew() => setLocale(const Locale('he'));
  static void setArabic() => setLocale(const Locale('ar'));

  static bool isRtl(Locale locale) => locale.languageCode == 'he' || locale.languageCode == 'ar';
}