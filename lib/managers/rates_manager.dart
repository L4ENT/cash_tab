import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/rates_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatesManager {
  RatesManager(this.ref);

  final Ref ref;

  Future<void> ratesViewAddToFavorites() async {
    final db = await ref.read(dbServiceProvider.future);
    final notifier = ref.read(faviriteTriigger.notifier);
    final rates = ref.read(ratesViewInputListProvider);
    final flag = await db.favoritesRepository.isFavorites(rates);
    if (flag) {
      await db.favoritesRepository.remove(rates);
    } else {
      await db.favoritesRepository.add(rates);
    }
    notifier.state = !notifier.state;
  }

  ratesViewPutSymbol(int index, String symbol) {
    final notifier = ref.read(ratesViewInputListProvider.notifier);
    notifier.replace(symbol, index);
  }
}

final ratesManagerProvider = Provider((ref) => RatesManager(ref));
