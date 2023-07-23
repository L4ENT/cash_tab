import 'package:cash_tab/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class CurrencyScrapper {
  Future<double?> _fetchFromXRatex(String symbol) async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
          'https://www.x-rates.com/table/?from=$symbol&amount=1',
        ),
      );
    } catch (e) {
      return null;
    }
    final document = parse(response.body);
    var rows = document.querySelectorAll('tr');
    double? rate;
    for (var row in rows) {
      var columns = row.querySelectorAll('td');
      if (columns.length == 3 && columns[0].text.trim() == 'US Dollar') {
        rate = double.parse(columns[1].text.trim());
        break;
      }
    }
    return rate;
  }

  Future<double?> fetchSymbol(String symbol) async {
    return await _fetchFromXRatex(symbol);
  }
}

class CurrencyScrapperProvider {
  CurrencyScrapperProvider({required this.ref});

  final Ref ref;
  final scrapper = CurrencyScrapper();

  Future<void> updateSymbol(String symbol) async {
    final db = await ref.read(dbServiceProvider.future);
    final record = await db.ratesRepository.getBySymbol(symbol);

    if (record != null) {
      Duration difference = DateTime.now().difference(record.updatedAt);
      if (difference.inSeconds > 300) {
        final usdPrice =
            symbol != 'USD' ? await scrapper.fetchSymbol(symbol) : 1.0;
        debugPrint('Fetch: $symbol/USD: $usdPrice');
        if (usdPrice != null) {
          await db.ratesRepository.update(symbol, usdPrice);
        }
      }
    }
  }
}

final currencySrapperProvider = Provider(
  (ref) => CurrencyScrapperProvider(ref: ref),
);
