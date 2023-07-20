import 'package:cash_tab/views/bottom_navigation_view.dart';
import 'package:cash_tab/views/currency_search_view.dart';
import 'package:cash_tab/views/favorites_view.dart';
import 'package:cash_tab/views/home_view.dart';
import 'package:cash_tab/views/languages_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var uuidLib = const Uuid();

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
          child: BottomNavigationView(
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeView(
              title: AppLocalizations.of(context)!.home,
            );
          },
        ),
        GoRoute(
          path: '/favorites',
          builder: (BuildContext context, GoRouterState state) {
            return FavoritesView(
              title: AppLocalizations.of(context)!.favorites,
            );
          },
        ),
        GoRoute(
          path: '/languages',
          builder: (BuildContext context, GoRouterState state) {
            return LanguagesView(
              title: AppLocalizations.of(context)!.language,
            );
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/currency/select/:index',
      builder: (BuildContext context, GoRouterState state) {
        int index = int.parse(state.pathParameters['index'] ?? '0');
        return CurrencySelectView(
          index: index,
        );
      },
    ),
  ],
);

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
      routerConfig: _router,
      theme: customTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
