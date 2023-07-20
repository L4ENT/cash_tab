import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cash_tab/utils.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  int locationToIndex(String location) {
    int index = 0;
    switch (location) {
      case '/':
        index = 0;
        break;
      case '/favorites':
        index = 1;
        break;
      case '/settings':
        index = 2;
        break;
      default:
    }
    return index;
  }

  String indexToLocation(int index) {
    String location = '/';
    switch (index) {
      case 0:
        location = '/';
        break;
      case 1:
        location = '/favorites';
        break;
      case 2:
        location = '/settings';
        break;
      default:
    }
    return location;
  }

  Future<void> goTo(BuildContext context, int index) async {
    final router = GoRouter.of(context);
    final routerState = GoRouterState.of(context);

    final currentIndex = locationToIndex(routerState.location);

    if (currentIndex == index) {
      return;
    }

    router.go(indexToLocation(index));
  }

  @override
  Widget build(BuildContext context) {
    final GoRouterState routerState = GoRouterState.of(context);
    final l10n = AppLocalizations.of(context)!;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.currency_exchange),
          label: l10n.rates.capitalize(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.bookmark),
          label: l10n.favorites.capitalize(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: l10n.settings.capitalize(),
        ),
      ],
      currentIndex: locationToIndex(routerState.location),
      onTap: (index) => {goTo(context, index)},
    );
  }
}
