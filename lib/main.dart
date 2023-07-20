import 'package:cash_tab/routes/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var uuidLib = const Uuid();

void main() async {
  // final isar = await isarOpen();
  // await mainSeed(isar);
  // await cleanSeed(isar);
  runApp(const ProviderScope(child: MyApp()));
}

final ThemeData customTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black26, // Set the desired color
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CashTab',
      routerConfig: routerConfig,
      theme: customTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
