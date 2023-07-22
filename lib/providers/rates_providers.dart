import 'package:cash_tab/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatesInputsListNotifier extends StateNotifier<List<String>> {
  RatesInputsListNotifier() : super(['USD', 'EUR']);

  void setUp(List<String> symbols) {
    state = symbols;
  }

  void add(String code) {
    state = [...state, code];
  }

  void remove(String code) {
    state = state.where((el) => el != code).toList();
  }

  void replace(String code, int index) {
    List<String> updated = [...state];
    if (index >= 0 && index < state.length) {
      updated[index] = code;
      state = updated;
    } else {
      add(code);
    }
  }

  void up(String code) {
    final from = state.indexOf(code);
    final to = from <= 0 ? from : from - 1;
    if (from != to) {
      state = swap(from, to);
    }
  }

  void down(String code) {
    final from = state.indexOf(code);
    final to = from >= state.length - 1 ? from : from + 1;
    if (from != to) {
      state = swap(from, to);
    }
  }

  List<String> swap(int a, int b) {
    List<String> updatedCodes = [...state];
    String temp = updatedCodes[a];
    updatedCodes[a] = updatedCodes[b];
    updatedCodes[b] = temp;
    return updatedCodes;
  }
}

final ratesViewInputListProvider =
    StateNotifierProvider<RatesInputsListNotifier, List<String>>((ref) {
  return RatesInputsListNotifier();
});

final rateViewInputFamily =
    StateProvider.family<double, String>((ref, rateCode) {
  return 0;
});

class RatesInputManager {
  RatesInputManager(this.ref);

  final Ref ref;

  Future<void> onInputChange(String code, double value) async {
    List<String> inputRatesCodes = ref.read(ratesViewInputListProvider);
    final db = await ref.read(dbServiceProvider.future);

    final ratesToChange = inputRatesCodes.where((el) => el != code);

    final mainRateItem = (await db.ratesRepository.getBySymbol(code))!;

    for (var symbol in ratesToChange) {
      final inputProvider = ref.read(rateViewInputFamily(symbol).notifier);
      final rateItem = (await db.ratesRepository.getBySymbol(symbol))!;
      double result = (value * (mainRateItem.usdPrice! / rateItem.usdPrice!));
      inputProvider.state = double.parse((result).toStringAsFixed(2));
    }
  }
}

final ratesInputsEditProvider = Provider((ref) {
  return RatesInputManager(ref);
});

final ratesRatioProvider = FutureProvider((ref) async {
  final symbols = ref.watch(ratesViewInputListProvider);
  final db = await ref.read(dbServiceProvider.future);
  final rates = await db.ratesRepository.getBySymbolsList(symbols);
  final ratesMap = {};
  for (var rate in rates) {
    ratesMap[rate.symbol] = rate.usdPrice!;
  }
  return ratesMap;
});

final faviriteTriigger = StateProvider((ref) => true);

final inFavoritesDbProvider = FutureProvider((ref) async {
  ref.watch(faviriteTriigger);
  final symbols = ref.watch(ratesViewInputListProvider);
  final db = await ref.read(dbServiceProvider.future);
  return await db.favoritesRepository.isFavorites(symbols);
});
