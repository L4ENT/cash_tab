import 'package:isar/isar.dart';

part 'currency_rates_collection.g.dart';

@collection
@Name("currency_rates")
class RatesCollectionItem {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(unique: true, replace: true)
  late String symbol;

  String? name;

  double? usdPrice;

  late DateTime updatedAt;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get words => [symbol, ...Isar.splitWords(name ?? '')];
}
