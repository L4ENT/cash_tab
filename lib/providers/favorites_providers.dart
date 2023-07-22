import 'package:cash_tab/isar/collections/favorites_colection.dart';
import 'package:cash_tab/routes/favorites/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesSearchResultNotifier extends StateNotifier<List<FavoritesItem>> {
  FavoritesSearchResultNotifier() : super([]);

  setUp(List<FavoritesItem> items) {
    state = items;
  }
}

final favoritesSearchResults =
    StateNotifierProvider<FavoritesSearchResultNotifier, List<FavoritesItem>>(
        (ref) {
  return FavoritesSearchResultNotifier();
});

final favoritesSortState = StateProvider((ref) => FavoritesSort.recents);
