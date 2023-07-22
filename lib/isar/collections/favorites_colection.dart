import 'package:isar/isar.dart';

part 'favorites_colection.g.dart';

@collection
@Name("favorites")
class FavoritesItem {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(unique: true, replace: true)
  String get key => symbols.join('');

  @Index(unique: true, replace: true)
  late List<String> symbols;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get words => symbols;
}
