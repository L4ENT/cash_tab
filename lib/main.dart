import 'package:cash_tab/isar/shortcuts.dart';
import 'package:cash_tab/providers/settings_providers.dart';
import 'package:cash_tab/routes/router.dart';
import 'package:cash_tab/seed/currency_rates_seed.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var uuidLib = const Uuid();

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final isar = await isarOpen();
  // await seedRatesCollection(isar);
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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    final languageNotifier = ref.read(languageProvider.notifier);
    Future.delayed(Duration.zero, () async {
      await languageNotifier.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    return MaterialApp.router(
      title: 'CashTab',
      routerConfig: routerConfig,
      theme: customTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language),
    );
  }
}
