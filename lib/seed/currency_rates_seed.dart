import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:isar/isar.dart';

Future<void> seedRatesCollection(Isar isar) async {
  final rates = [
    {'symbol': 'USD', 'usdPrice': 1.0, 'name': 'United States Dollar'},
    {'symbol': 'EUR', 'usdPrice': 1.11, 'name': 'Euro'},
    {'symbol': 'JPY', 'usdPrice': 0.0071, 'name': 'Japanese Yen'},
    {'symbol': 'GBP', 'usdPrice': 1.30, 'name': 'British Pound Sterling'},
    {'symbol': 'AUD', 'usdPrice': 0.75, 'name': 'Australian Dollar'},
    {'symbol': 'CAD', 'usdPrice': 0.80, 'name': 'Canadian Dollar'},
    {'symbol': 'CHF', 'usdPrice': 1.02, 'name': 'Swiss Franc'},
    {'symbol': 'CNY', 'usdPrice': 0.15, 'name': 'Chinese Yuan'},
    {'symbol': 'SEK', 'usdPrice': 0.11, 'name': 'Swedish Krona'},
    {'symbol': 'NZD', 'usdPrice': 0.70, 'name': 'New Zealand Dollar'},
    {'symbol': 'MXN', 'usdPrice': 0.050, 'name': 'Mexican Peso'},
    {'symbol': 'SGD', 'usdPrice': 0.74, 'name': 'Singapore Dollar'},
    {'symbol': 'HKD', 'usdPrice': 0.13, 'name': 'Hong Kong Dollar'},
    {'symbol': 'NOK', 'usdPrice': 0.12, 'name': 'Norwegian Krone'},
    {'symbol': 'KRW', 'usdPrice': 0.00084, 'name': 'South Korean Won'},
    {'symbol': 'TRY', 'usdPrice': 0.11, 'name': 'Turkish Lira'},
    {'symbol': 'RUB', 'usdPrice': 0.011, 'name': 'Russian Ruble'},
    {'symbol': 'BRL', 'usdPrice': 0.19, 'name': 'Brazilian Real'},
    {'symbol': 'ZAR', 'usdPrice': 0.065, 'name': 'South African Rand'},
    {'symbol': 'INR', 'usdPrice': 0.014, 'name': 'Indian Rupee'},
    {'symbol': 'VND', 'usdPrice': 0.000044, 'name': 'Vietnamese Dong'},
    {'symbol': 'IDR', 'usdPrice': 0.000065, 'name': 'Indonesian Rupiah'}
  ];

  await isar.writeTxn(() async {
    await isar.collection<RatesCollectionItem>().clear();
  });

  await isar.writeTxn(() async {
    for (var rateObject in rates) {
      final tag = RatesCollectionItem()
        ..symbol = rateObject['symbol'].toString()
        ..name = rateObject['name'].toString()
        ..usdPrice = double.parse(rateObject['usdPrice'].toString())
        ..updatedAt = DateTime.now();
      await isar.collection<RatesCollectionItem>().put(tag);
    }
  });
}

Future<void> truncateRatesCollection(Isar isar) async {
  await isar.writeTxn(() async {
    await isar.collection<RatesCollectionItem>().clear();
  });
}
