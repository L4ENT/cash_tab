import 'dart:ffi';

import 'package:cash_tab/isar/collections/currency_rates_collection.dart';
import 'package:cash_tab/isar/collections/favorites_colection.dart';
import 'package:cash_tab/routes/favorites/enums.dart';
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

  Future<List<FavoritesItem>> all(FavoritesSort? sort) async {
    switch (sort) {
      case FavoritesSort.az:
        return await allSortedByAz();
      case FavoritesSort.recents:
        return await allSortedByUsedAt();
      default:
        return await allSortedByAz();
    }
  }

  Future<List<FavoritesItem>> allSortedByUsedAt() async {
    return await isar
        .collection<FavoritesItem>()
        .where()
        .sortByUsedAtDesc()
        .findAll();
  }

  Future<List<FavoritesItem>> allSortedByAz() async {
    return await isar.collection<FavoritesItem>().where().sortByKey().findAll();
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
      final favorite = FavoritesItem()
        ..symbols = symbols
        ..usedAt = DateTime.now();
      await isar.collection<FavoritesItem>().put(favorite);
    });
  }

  Future<void> updatedUsedAt(String key) async {
    final favorite = await isar.collection<FavoritesItem>().getByKey(key);
    await isar.writeTxn(() async {
      favorite!.usedAt = DateTime.now();
      await isar.collection<FavoritesItem>().put(favorite);
    });
  }

  Future<void> remove(List<String> symbols) async {
    await isar.writeTxn(() async {
      await isar.collection<FavoritesItem>().deleteByKey(symbols.join(''));
    });
  }

  Future<List<FavoritesItem>> search(String query) async {
    return await isar
        .collection<FavoritesItem>()
        .where()
        .wordsElementStartsWith(query)
        .findAll();
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
