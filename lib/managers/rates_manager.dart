import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/rates_providers.dart';
import 'package:cash_tab/providers/rates_view_search_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatesManager {
  RatesManager(this.ref);

  final Ref ref;

  Future<void> updateSerachView({String? prompt}) async {
    final dbProvider = await ref.watch(dbServiceProvider.future);
    final items = await dbProvider.ratesRepository.search(prompt ?? '');
    final symbolsNotifier = ref.watch(ratesViewSearchResults.notifier);
    symbolsNotifier.setUp(items);
  }

  setUpRatesView(List<String> symbols) {
    final currentSymbols = ref.read(ratesViewInputListProvider);

    for (var symbol in currentSymbols) {
      final inputProvider = ref.read(rateViewInputFamily(symbol).notifier);
      inputProvider.state = 0;
    }

    final ratesNotifier = ref.read(ratesViewInputListProvider.notifier);
    ratesNotifier.setUp(symbols);
    settingsSave();
  }

  Future<void> ratesViewAddToFavorites() async {
    final db = await ref.read(dbServiceProvider.future);
    final favoritesTrigger = ref.read(ratesViewFavoriteTrigger.notifier);
    final rates = ref.read(ratesViewInputListProvider);
    final flag = await db.favoritesRepository.isFavorites(rates);
    if (flag) {
      await db.favoritesRepository.remove(rates);
    } else {
      await db.favoritesRepository.add(rates);
    }
    favoritesTrigger.trigger();
  }

  ratesViewPutSymbol(int index, String symbol) {
    final currentSymbols = ref.read(ratesViewInputListProvider);

    for (var symbol in currentSymbols) {
      final inputProvider = ref.read(rateViewInputFamily(symbol).notifier);
      inputProvider.state = 0;
    }

    final notifier = ref.read(ratesViewInputListProvider.notifier);
    notifier.replace(symbol, index);
    settingsSave();
  }

  Future<void> updateLastUsed(String symbol) async {
    final db = await ref.read(dbServiceProvider.future);
    await db.ratesRepository.updateLastUsed(symbol, DateTime.now());
  }

  Future<void> settingsSave() async {
    final symbols = ref.read(ratesViewInputListProvider);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('home_symbols', symbols);
  }

  Future<void> settingsLoad() async {
    final prefs = await SharedPreferences.getInstance();
    final symbols = prefs.getStringList('home_symbols') ?? ['USD', 'EUR'];
    setUpRatesView(symbols);
  }
}

final ratesManagerProvider = Provider((ref) => RatesManager(ref));
