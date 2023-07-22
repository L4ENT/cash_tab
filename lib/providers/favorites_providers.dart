import 'package:cash_tab/isar/collections/favorites_colection.dart';
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
