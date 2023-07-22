import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en');

  Future<void> set(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageCode);
    state = languageCode;
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language');
    if (languageCode == null) {
      final platformLang = Platform.localeName.split('_')[0];
      state = platformLang;
    } else {
      state = languageCode;
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});

class DarkThemeNotifier extends StateNotifier<bool> {
  DarkThemeNotifier() : super(true);

  Future<void> set(bool darkThemeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darktheme', darkThemeMode);
    state = darkThemeMode;
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final darkThemeMode = prefs.getBool('darktheme');
    if (darkThemeMode == null) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      state = isDarkMode;
    } else {
      state = darkThemeMode;
    }
  }
}

final darkThemeProvider = StateNotifierProvider<DarkThemeNotifier, bool>((ref) {
  return DarkThemeNotifier();
});
