import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('th'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'th':
        return 'πΉπ­';
      case 'en':
      default:
        return 'πΊπΈ';
    }
  }
}
