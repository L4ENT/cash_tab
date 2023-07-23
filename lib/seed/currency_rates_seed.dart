import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

Future<void> seedRatesCollection(Isar isar) async {
  final rates = [
    {'symbol': 'USD', 'usdPrice': 1.0, 'name': 'United States Dollar'},
    {'symbol': 'EUR', 'usdPrice': 1.12, 'name': 'Euro'},
    {'symbol': 'JPY', 'usdPrice': 0.009, 'name': 'Japanese Yen'},
    {'symbol': 'GBP', 'usdPrice': 1.32, 'name': 'British Pound Sterling'},
    {'symbol': 'AUD', 'usdPrice': 0.73, 'name': 'Australian Dollar'},
    {'symbol': 'CAD', 'usdPrice': 0.78, 'name': 'Canadian Dollar'},
    {'symbol': 'CHF', 'usdPrice': 1.08, 'name': 'Swiss Franc'},
    {'symbol': 'CNY', 'usdPrice': 0.15, 'name': 'Chinese Yuan'},
    {'symbol': 'SEK', 'usdPrice': 0.11, 'name': 'Swedish Krona'},
    {'symbol': 'NZD', 'usdPrice': 0.69, 'name': 'New Zealand Dollar'},
    {'symbol': 'MXN', 'usdPrice': 0.049, 'name': 'Mexican Peso'},
    {'symbol': 'SGD', 'usdPrice': 0.74, 'name': 'Singapore Dollar'},
    {'symbol': 'HKD', 'usdPrice': 0.13, 'name': 'Hong Kong Dollar'},
    {'symbol': 'NOK', 'usdPrice': 0.11, 'name': 'Norwegian Krone'},
    {'symbol': 'KRW', 'usdPrice': 0.00083, 'name': 'South Korean Won'},
    {'symbol': 'TRY', 'usdPrice': 0.11, 'name': 'Turkish Lira'},
    {'symbol': 'RUB', 'usdPrice': 0.013, 'name': 'Russian Ruble'},
    {'symbol': 'INR', 'usdPrice': 0.013, 'name': 'Indian Rupee'},
    {'symbol': 'BRL', 'usdPrice': 0.19, 'name': 'Brazilian Real'},
    {'symbol': 'ZAR', 'usdPrice': 0.066, 'name': 'South African Rand'},
    {'symbol': 'DKK', 'usdPrice': 0.16, 'name': 'Danish Krone'},
    {'symbol': 'EGP', 'usdPrice': 0.064, 'name': 'Egyptian Pound'},
    {'symbol': 'IDR', 'usdPrice': 0.000070, 'name': 'Indonesian Rupiah'},
    {'symbol': 'ILS', 'usdPrice': 0.31, 'name': 'Israeli New Shekel'},
    {'symbol': 'MYR', 'usdPrice': 0.24, 'name': 'Malaysian Ringgit'},
    {'symbol': 'PHP', 'usdPrice': 0.020, 'name': 'Philippine Peso'},
    {'symbol': 'PLN', 'usdPrice': 0.26, 'name': 'Polish Złoty'},
    {'symbol': 'THB', 'usdPrice': 0.030, 'name': 'Thai Baht'},
    {'symbol': 'TWD', 'usdPrice': 0.035, 'name': 'New Taiwan Dollar'},
    {'symbol': 'VND', 'usdPrice': 0.000043, 'name': 'Vietnamese đồng'},
    {'symbol': 'AFN', 'usdPrice': 0.013, 'name': 'Afghan Afghani'},
    {'symbol': 'AMD', 'usdPrice': 0.0020, 'name': 'Armenian Dram'},
    {'symbol': 'AOA', 'usdPrice': 0.0016, 'name': 'Angolan Kwanza'},
    {'symbol': 'ARS', 'usdPrice': 0.010, 'name': 'Argentine Peso'},
    {
      'symbol': 'BAM',
      'usdPrice': 0.59,
      'name': 'Bosnia and Herzegovina convertible mark'
    },
    {'symbol': 'BDT', 'usdPrice': 0.012, 'name': 'Bangladeshi Taka'},
    {'symbol': 'BGN', 'usdPrice': 0.61, 'name': 'Bulgarian Lev'},
    {'symbol': 'BHD', 'usdPrice': 2.65, 'name': 'Bahraini Dinar'},
    {'symbol': 'BND', 'usdPrice': 0.74, 'name': 'Brunei Dollar'},
    {'symbol': 'BOB', 'usdPrice': 0.14, 'name': 'Bolivian Boliviano'},
    {'symbol': 'BWP', 'usdPrice': 0.092, 'name': 'Botswana Pula'},
    {'symbol': 'BYN', 'usdPrice': 0.39, 'name': 'Belarusian Ruble'},
    {'symbol': 'CLP', 'usdPrice': 0.0013, 'name': 'Chilean Peso'},
    {'symbol': 'COP', 'usdPrice': 0.00026, 'name': 'Colombian Peso'},
    {'symbol': 'CRC', 'usdPrice': 0.0016, 'name': 'Costa Rican Colón'},
    {'symbol': 'CUP', 'usdPrice': 0.038, 'name': 'Cuban Peso'},
    {'symbol': 'CZK', 'usdPrice': 0.045, 'name': 'Czech Koruna'},
    {'symbol': 'DZD', 'usdPrice': 0.0073, 'name': 'Algerian Dinar'},
    {'symbol': 'ETB', 'usdPrice': 0.022, 'name': 'Ethiopian Birr'},
    {'symbol': 'FJD', 'usdPrice': 0.47, 'name': 'Fijian Dollar'},
    {'symbol': 'GEL', 'usdPrice': 0.31, 'name': 'Georgian Lari'},
    {'symbol': 'GHS', 'usdPrice': 0.17, 'name': 'Ghanaian Cedi'},
    {'symbol': 'GTQ', 'usdPrice': 0.13, 'name': 'Guatemalan Quetzal'},
    {'symbol': 'HNL', 'usdPrice': 0.041, 'name': 'Honduran Lempira'},
    {'symbol': 'HRK', 'usdPrice': 0.16, 'name': 'Croatian Kuna'},
    {'symbol': 'HUF', 'usdPrice': 0.0033, 'name': 'Hungarian Forint'},
    {'symbol': 'IRR', 'usdPrice': 0.000024, 'name': 'Iranian Rial'},
    {'symbol': 'ISK', 'usdPrice': 0.0078, 'name': 'Icelandic Króna'},
    {'symbol': 'JMD', 'usdPrice': 0.0065, 'name': 'Jamaican Dollar'},
    {'symbol': 'JOD', 'usdPrice': 1.41, 'name': 'Jordanian Dinar'},
    {'symbol': 'KES', 'usdPrice': 0.0091, 'name': 'Kenyan Shilling'},
    {'symbol': 'KHR', 'usdPrice': 0.00025, 'name': 'Cambodian Riel'},
    {'symbol': 'KWD', 'usdPrice': 3.32, 'name': 'Kuwaiti Dinar'},
    {'symbol': 'KZT', 'usdPrice': 0.0023, 'name': 'Kazakhstani Tenge'},
    {'symbol': 'LAK', 'usdPrice': 0.00011, 'name': 'Lao Kip'},
    {'symbol': 'LBP', 'usdPrice': 0.00066, 'name': 'Lebanese Pound'},
    {'symbol': 'LKR', 'usdPrice': 0.0050, 'name': 'Sri Lankan Rupee'},
    {'symbol': 'MAD', 'usdPrice': 0.11, 'name': 'Moroccan Dirham'},
    {'symbol': 'MDL', 'usdPrice': 0.057, 'name': 'Moldovan Leu'},
    {'symbol': 'MKD', 'usdPrice': 0.019, 'name': 'Macedonian Denar'},
    {'symbol': 'MMK', 'usdPrice': 0.00062, 'name': 'Myanmar Kyat'},
    {'symbol': 'MOP', 'usdPrice': 0.125, 'name': 'Macanese Pataca'},
    {'symbol': 'MUR', 'usdPrice': 0.023, 'name': 'Mauritian Rupee'},
    {'symbol': 'MVR', 'usdPrice': 0.065, 'name': 'Maldivian Rufiyaa'},
    {'symbol': 'MWK', 'usdPrice': 0.0013, 'name': 'Malawian Kwacha'},
    {'symbol': 'NAD', 'usdPrice': 0.069, 'name': 'Namibian Dollar'},
    {'symbol': 'NGN', 'usdPrice': 0.0024, 'name': 'Nigerian Naira'},
    {'symbol': 'NIO', 'usdPrice': 0.029, 'name': 'Nicaraguan Córdoba'},
    {'symbol': 'NPR', 'usdPrice': 0.0084, 'name': 'Nepalese Rupee'},
    {'symbol': 'OMR', 'usdPrice': 2.60, 'name': 'Omani Rial'}
  ];

  await isar.writeTxn(() async {
    await isar.collection<RatesCollectionItem>().clear();
  });

  final ratesCount = await isar.collection<RatesCollectionItem>().count();

  if (ratesCount >= rates.length) {
    return;
  }

  debugPrint('Start to seed rates: ${rates.length - ratesCount}');

  await isar.writeTxn(() async {
    for (var rateObject in rates) {
      final record = await isar
          .collection<RatesCollectionItem>()
          .getBySymbol(rateObject['symbol'].toString());

      if (record == null) {
        final tag = RatesCollectionItem()
          ..symbol = rateObject['symbol'].toString()
          ..name = rateObject['name'].toString()
          ..usdPrice = double.parse(rateObject['usdPrice'].toString())
          ..updatedAt = DateTime.now()
          ..lastUsedAt = DateTime.now();
        await isar.collection<RatesCollectionItem>().put(tag);
      }
    }
  });

  debugPrint('Seed finished');
}

Future<void> truncateRatesCollection(Isar isar) async {
  await isar.writeTxn(() async {
    await isar.collection<RatesCollectionItem>().clear();
  });
}
