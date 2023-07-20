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
      case '/account':
        index = 1;
        break;
      case '/favorites':
        index = 2;
        break;
      case '/languages':
        index = 3;
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
        location = '/account';
        break;
      case 2:
        location = '/favorites';
        break;
      case 3:
        location = '/languages';
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
          icon: const Icon(Icons.home),
          label: l10n.home.capitalize(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: l10n.account.capitalize(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.bookmark),
          label: l10n.favorites.capitalize(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.language),
          label: l10n.language.capitalize(),
        ),
      ],
      currentIndex: locationToIndex(routerState.location),
      onTap: (index) => {goTo(context, index)},
    );
  }
}
