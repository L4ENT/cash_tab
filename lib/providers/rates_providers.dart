import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatesInputsListNotifier extends StateNotifier<List<String>> {
  RatesInputsListNotifier() : super(['USD', 'EUR']);

  void add(String code) {
    state = [...state, code];
  }

  void remove(String code) {
    state = state.where((el) => el != code).toList();
  }

  void replace(String code, int index) {
    List<String> updated = [...state];
    updated[index] = code;
    state = updated;
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

  onInputChange(String code, double value) {
    List<String> inputRatesCodes = ref.read(ratesViewInputListProvider);
    final ratesToChange = inputRatesCodes.where((el) => el != code);
    for (var el in ratesToChange) {
      final inputProvider = ref.read(rateViewInputFamily(el).notifier);
      // TODO:  get the real rate
      inputProvider.state = value * 100;
    }
  }
}

final ratesInputsEditProvider = Provider((ref) {
  return RatesInputManager(ref);
});
