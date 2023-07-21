import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:isar/isar.dart';

abstract class SubService {}

class RatesRepository extends SubService {
  RatesRepository({required this.isar});

  final Isar isar;

  Future<List<RatesCollectionItem>> all() async {
    final allRates =
        await isar.collection<RatesCollectionItem>().where().findAll();
    return allRates;
  }

  Future<List<RatesCollectionItem>> search(String query) async {
    final result = await isar
        .collection<RatesCollectionItem>()
        .where()
        .wordsElementStartsWith(query)
        .findAll();
    return result;
  }

  Future<RatesCollectionItem?> getBySymbol(String symbol) async {
    return await isar.collection<RatesCollectionItem>().getBySymbol(symbol);
  }

  Future<List<RatesCollectionItem>> getBySymbolsList(
      List<String> symbols) async {
    return await isar
        .collection<RatesCollectionItem>()
        .where()
        .anyOf(symbols, (q, element) => q.symbolEqualTo(element))
        .findAll();
  }
}

class DbService {
  final Isar isar;
  late RatesRepository ratesRepository;

  DbService({required this.isar}) {
    ratesRepository = RatesRepository(isar: isar);
  }
}
