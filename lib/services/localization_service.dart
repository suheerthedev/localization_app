import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LocalizationService extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Default to English
  Map<String, String> _localizedStrings = {};

  Locale get locale => _locale;

  Future<void> loadLocale(Locale locale) async {
    _locale = locale;

    // Load the appropriate JSON file
    String jsonString = await rootBundle.loadString(
      'assets/lang/${locale.languageCode}.json',
    );

    // Parse the JSON
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

    notifyListeners();
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  void switchLanguage() {
    // Toggle between English and Urdu
    if (_locale.languageCode == 'en') {
      loadLocale(const Locale('ur'));
    } else {
      loadLocale(const Locale('en'));
    }
  }
}