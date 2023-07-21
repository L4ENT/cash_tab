import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SymbolsSearchResultNotifier
    extends StateNotifier<List<RatesCollectionItem>> {
  SymbolsSearchResultNotifier() : super([]);

  setUp(List<RatesCollectionItem> items) {
    state = items;
  }
}

final ratesViewSearchResults = StateNotifierProvider<
    SymbolsSearchResultNotifier, List<RatesCollectionItem>>((ref) {
  return SymbolsSearchResultNotifier();
});
