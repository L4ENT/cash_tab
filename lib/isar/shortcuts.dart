import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> isarOpen() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [RatesCollectionItemSchema],
    directory: dir.path,
  );
  return isar;
}
