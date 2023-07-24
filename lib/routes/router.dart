import 'package:cash_tab/routes/settings/appereance_view.dart';
import 'package:cash_tab/routes/splash/index_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cash_tab/routes/rates/search_view.dart';
import 'package:cash_tab/routes/favorites/index_view.dart';
import 'package:cash_tab/routes/settings/languages_view.dart';
import 'package:cash_tab/routes/settings/index_view.dart';
import 'package:cash_tab/components/bottom_navigation_view.dart';
import 'package:cash_tab/routes/rates/index_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
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
          parentNavigatorKey: _shellNavigatorKey,
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return RatesView(
              title: AppLocalizations.of(context)!.home,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/favorites',
          builder: (BuildContext context, GoRouterState state) {
            return FavoritesView(
              title: AppLocalizations.of(context)!.favorites,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) {
            return SettingsView(
              title: AppLocalizations.of(context)!.settings,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/settings/language',
          builder: (BuildContext context, GoRouterState state) {
            return LanguagesView(
              title: AppLocalizations.of(context)!.language,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/settings/appereance',
          builder: (BuildContext context, GoRouterState state) {
            return AppearanceSettingsView(
              title: AppLocalizations.of(context)!.appereance,
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
