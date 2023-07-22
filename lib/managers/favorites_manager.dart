import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/favorites_providers.dart';
import 'package:cash_tab/providers/rates_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesManager {
  FavoritesManager(this.ref);

  final Ref ref;

  Future<void> updateViewList({String? prompt}) async {
    final dbService = await ref.read(dbServiceProvider.future);
    final sort = ref.read(favoritesSortState);
    final items =
        await dbService.favoritesRepository.search(prompt ?? '', sort: sort);
    final favoritesNotifier = ref.read(favoritesSearchResults.notifier);
    favoritesNotifier.setUp(items);
  }

  Future<void> remove(List<String> symbols) async {
    final db = await ref.read(dbServiceProvider.future);
    await db.favoritesRepository.remove(symbols);
    await updateViewList();
    final favoritesTrigger = ref.read(ratesViewFavoriteTrigger.notifier);
    favoritesTrigger.trigger();
  }

  Future<void> updateUsedAt(List<String> symbols) async {
    final db = await ref.read(dbServiceProvider.future);
    await db.favoritesRepository.updatedUsedAt(symbols.join(''));
    await updateViewList();
  }
}

final favoritesManagerProvider = Provider((ref) => FavoritesManager(ref));
