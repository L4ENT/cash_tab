import 'package:cash_tab/components/favorites_search_input.dart';
import 'package:cash_tab/components/favorites_sort_dropdown.dart';
import 'package:cash_tab/managers/favorites_manager.dart';
import 'package:cash_tab/managers/rates_manager.dart';
import 'package:cash_tab/providers/favorites_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key, required this.title});

  final String title;

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await onInitState();
    });

    super.initState();
  }

  Future<void> onInitState() async {
    final favoritesManager = ref.read(favoritesManagerProvider);
    await favoritesManager.updateViewList();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    final favorites = ref.watch(favoritesSearchResults);
    final favoritesManager = ref.watch(favoritesManagerProvider);
    final ratesManager = ref.read(ratesManagerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title.capitalize())),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(child: FavoritesSearchInputWidget()),
                  SizedBox(width: 24),
                  FavoritesSortDropdown()
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...favorites.map(
                        (favoriteItem) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: const Icon(Icons.remove_circle),
                                onTap: () async {
                                  favoritesManager.remove(favoriteItem.symbols);
                                },
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  favoriteItem.symbols.join(' / '),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              GestureDetector(
                                child: const Icon(Icons.arrow_forward),
                                onTap: () async {
                                  favoritesManager
                                      .updateUsedAt(favoriteItem.symbols);
                                  ratesManager
                                      .setUpRatesView(favoriteItem.symbols);
                                  router.go('/');
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
