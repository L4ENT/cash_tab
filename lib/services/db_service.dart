import 'dart:ffi';

import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:cash_tab/isar/collections/favorites_colection.dart';
import 'package:flutter/material.dart';
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

class FavoritesRepository {
  FavoritesRepository({required this.isar});

  final Isar isar;

  Future<List<FavoritesItem>> all() async {
    return await isar.collection<FavoritesItem>().where().findAll();
  }

  Future<bool> isFavorites(List<String> symbols) async {
    final count = await isar
        .collection<FavoritesItem>()
        .where()
        .keyEqualTo(symbols.join(''))
        .count();
    return count > 0;
  }

  Future<void> add(List<String> symbols) async {
    await isar.writeTxn(() async {
      final favorite = FavoritesItem()..symbols = symbols;
      debugPrint('Saaaaave');
      await isar.collection<FavoritesItem>().put(favorite);
    });
  }

  Future<void> remove(List<String> symbols) async {
    await isar.writeTxn(() async {
      debugPrint('Remooove');
      await isar.collection<FavoritesItem>().deleteByKey(symbols.join(''));
    });
  }
}

class DbService {
  final Isar isar;
  late RatesRepository ratesRepository;
  late FavoritesRepository favoritesRepository;

  DbService({required this.isar}) {
    ratesRepository = RatesRepository(isar: isar);
    favoritesRepository = FavoritesRepository(isar: isar);
  }
}
