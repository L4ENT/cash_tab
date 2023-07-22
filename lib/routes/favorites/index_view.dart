import 'package:cash_tab/components/favorites_search_input.dart';
import 'package:cash_tab/components/favorites_sort_dropdown.dart';
import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/favorites_providers.dart';
import 'package:cash_tab/providers/rates_providers.dart';
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
    final dbService = await ref.read(dbServiceProvider.future);
    final sort = ref.read(favoritesSortState);
    final items = await dbService.favoritesRepository.all(sort);
    final favoritesNotifier = ref.read(favoritesSearchResults.notifier);
    favoritesNotifier.setUp(items);
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    final favorites = ref.watch(favoritesSearchResults);
    final ratesNotifier = ref.watch(ratesViewInputListProvider.notifier);

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
                              Expanded(
                                child: Text(
                                  favoriteItem.symbols.join(' / '),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              GestureDetector(
                                child: const Icon(Icons.arrow_circle_right),
                                onTap: () async {
                                  final db =
                                      await ref.read(dbServiceProvider.future);
                                  await db.favoritesRepository.updatedUsedAt(
                                      favoriteItem.symbols.join(''));
                                  ratesNotifier.setUp(favoriteItem.symbols);
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
