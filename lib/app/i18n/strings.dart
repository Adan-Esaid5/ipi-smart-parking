import 'package:flutter/material.dart';

class S {
  static String _code(BuildContext context) => Localizations.localeOf(context).languageCode;

  static String t(BuildContext context, String key) {
    final lang = _code(context);
    return _map[lang]?[key] ?? _map['en']![key] ?? key;
  }

  static const Map<String, Map<String, String>> _map = {
    'en': {
      'home_title': 'Home',
      'ipi_title': 'IPI Smart Parking',
      'active_parking': 'Active parking',
      'parking_lots': 'IPI parking lots',
      'gps': 'GPS',
      'payments': 'Payments',
      'history': 'History',
      'media': 'Media',
      'contact': 'Contact',
      'about': 'About',
      'admin': 'Admin',
      'open': 'Open',
      'language': 'Language',
      'choose_language': 'Choose language',
    },
    'he': {
      'home_title': 'בית',
      'ipi_title': 'IPI חניה חכמה',
      'active_parking': 'חניה פעילה',
      'parking_lots': 'חניונים של IPI',
      'gps': 'מיקום (GPS)',
      'payments': 'תשלומים',
      'history': 'היסטוריה',
      'media': 'מדיה',
      'contact': 'צור קשר',
      'about': 'אודות',
      'admin': 'מנהל',
      'open': 'פתחי',
      'language': 'שפה',
      'choose_language': 'בחרי שפה',
    },
    'ar': {
      'home_title': 'الرئيسية',
      'ipi_title': 'موقف ذكي IPI',
      'active_parking': 'موقف نشط',
      'parking_lots': 'مواقف IPI',
      'gps': 'GPS',
      'payments': 'المدفوعات',
      'history': 'السجل',
      'media': 'الوسائط',
      'contact': 'تواصل',
      'about': 'حول',
      'admin': 'المدير',
      'open': 'فتح',
      'language': 'اللغة',
      'choose_language': 'اختاري اللغة',
    },
  };
}