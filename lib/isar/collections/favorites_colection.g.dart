// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_colection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoritesItemCollection on Isar {
  IsarCollection<FavoritesItem> get favoritesItems => this.collection();
}

const FavoritesItemSchema = CollectionSchema(
  name: r'favorites',
  id: 3451342447793213691,
  properties: {
    r'key': PropertySchema(
      id: 0,
      name: r'key',
      type: IsarType.string,
    ),
    r'symbols': PropertySchema(
      id: 1,
      name: r'symbols',
      type: IsarType.stringList,
    ),
    r'usedAt': PropertySchema(
      id: 2,
      name: r'usedAt',
      type: IsarType.dateTime,
    ),
    r'words': PropertySchema(
      id: 3,
      name: r'words',
      type: IsarType.stringList,
    )
  },
  estimateSize: _favoritesItemEstimateSize,
  serialize: _favoritesItemSerialize,
  deserialize: _favoritesItemDeserialize,
  deserializeProp: _favoritesItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'symbols': IndexSchema(
      id: -7848906159600782097,
      name: r'symbols',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'symbols',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'key': IndexSchema(
      id: -4906094122524121629,
      name: r'key',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'key',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'words': IndexSchema(
      id: -8729652909246617716,
      name: r'words',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'words',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _favoritesItemGetId,
  getLinks: _favoritesItemGetLinks,
  attach: _favoritesItemAttach,
  version: '3.1.0+1',
);

int _favoritesItemEstimateSize(
  FavoritesItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.symbols.length * 3;
  {
    for (var i = 0; i < object.symbols.length; i++) {
      final value = object.symbols[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.words.length * 3;
  {
    for (var i = 0; i < object.words.length; i++) {
      final value = object.words[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _favoritesItemSerialize(
  FavoritesItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.key);
  writer.writeStringList(offsets[1], object.symbols);
  writer.writeDateTime(offsets[2], object.usedAt);
  writer.writeStringList(offsets[3], object.words);
}

FavoritesItem _favoritesItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoritesItem();
  object.id = id;
  object.symbols = reader.readStringList(offsets[1]) ?? [];
  object.usedAt = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _favoritesItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoritesItemGetId(FavoritesItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoritesItemGetLinks(FavoritesItem object) {
  return [];
}

void _favoritesItemAttach(
    IsarCollection<dynamic> col, Id id, FavoritesItem object) {
  object.id = id;
}

extension FavoritesItemByIndex on IsarCollection<FavoritesItem> {
  Future<FavoritesItem?> getBySymbols(List<String> symbols) {
    return getByIndex(r'symbols', [symbols]);
  }

  FavoritesItem? getBySymbolsSync(List<String> symbols) {
    return getByIndexSync(r'symbols', [symbols]);
  }

  Future<bool> deleteBySymbols(List<String> symbols) {
    return deleteByIndex(r'symbols', [symbols]);
  }

  bool deleteBySymbolsSync(List<String> symbols) {
    return deleteByIndexSync(r'symbols', [symbols]);
  }

  Future<List<FavoritesItem?>> getAllBySymbols(
      List<List<String>> symbolsValues) {
    final values = symbolsValues.map((e) => [e]).toList();
    return getAllByIndex(r'symbols', values);
  }

  List<FavoritesItem?> getAllBySymbolsSync(List<List<String>> symbolsValues) {
    final values = symbolsValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'symbols', values);
  }

  Future<int> deleteAllBySymbols(List<List<String>> symbolsValues) {
    final values = symbolsValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'symbols', values);
  }

  int deleteAllBySymbolsSync(List<List<String>> symbolsValues) {
    final values = symbolsValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'symbols', values);
  }

  Future<Id> putBySymbols(FavoritesItem object) {
    return putByIndex(r'symbols', object);
  }

  Id putBySymbolsSync(FavoritesItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'symbols', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySymbols(List<FavoritesItem> objects) {
    return putAllByIndex(r'symbols', objects);
  }

  List<Id> putAllBySymbolsSync(List<FavoritesItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'symbols', objects, saveLinks: saveLinks);
  }

  Future<FavoritesItem?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  FavoritesItem? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<FavoritesItem?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<FavoritesItem?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'key', values);
  }

  Future<Id> putByKey(FavoritesItem object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(FavoritesItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<FavoritesItem> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(List<FavoritesItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension FavoritesItemQueryWhereSort
    on QueryBuilder<FavoritesItem, FavoritesItem, QWhere> {
  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhere> anyWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'words'),
      );
    });
  }
}

extension FavoritesItemQueryWhere
    on QueryBuilder<FavoritesItem, FavoritesItem, QWhereClause> {
  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> symbolsEqualTo(
      List<String> symbols) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'symbols',
        value: [symbols],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      symbolsNotEqualTo(List<String> symbols) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbols',
              lower: [],
              upper: [symbols],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbols',
              lower: [symbols],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbols',
              lower: [symbols],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbols',
              lower: [],
              upper: [symbols],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> keyEqualTo(
      String key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'key',
        value: [key],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause> keyNotEqualTo(
      String key) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementEqualTo(String wordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'words',
        value: [wordsElement],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementNotEqualTo(String wordsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'words',
              lower: [],
              upper: [wordsElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'words',
              lower: [wordsElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'words',
              lower: [wordsElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'words',
              lower: [],
              upper: [wordsElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementGreaterThan(
    String wordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'words',
        lower: [wordsElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementLessThan(
    String wordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'words',
        lower: [],
        upper: [wordsElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementBetween(
    String lowerWordsElement,
    String upperWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'words',
        lower: [lowerWordsElement],
        includeLower: includeLower,
        upper: [upperWordsElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementStartsWith(String WordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'words',
        lower: [WordsElementPrefix],
        upper: ['$WordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'words',
        value: [''],
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterWhereClause>
      wordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'words',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'words',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'words',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'words',
              upper: [''],
            ));
      }
    });
  }
}

extension FavoritesItemQueryFilter
    on QueryBuilder<FavoritesItem, FavoritesItem, QFilterCondition> {
  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbols',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbols',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbols',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbols',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      symbolsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symbols',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usedAt',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usedAt',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      usedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'words',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'words',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'words',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'words',
        value: '',
      ));
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterFilterCondition>
      wordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FavoritesItemQueryObject
    on QueryBuilder<FavoritesItem, FavoritesItem, QFilterCondition> {}

extension FavoritesItemQueryLinks
    on QueryBuilder<FavoritesItem, FavoritesItem, QFilterCondition> {}

extension FavoritesItemQuerySortBy
    on QueryBuilder<FavoritesItem, FavoritesItem, QSortBy> {
  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> sortByUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedAt', Sort.asc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> sortByUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedAt', Sort.desc);
    });
  }
}

extension FavoritesItemQuerySortThenBy
    on QueryBuilder<FavoritesItem, FavoritesItem, QSortThenBy> {
  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenByUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedAt', Sort.asc);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QAfterSortBy> thenByUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedAt', Sort.desc);
    });
  }
}

extension FavoritesItemQueryWhereDistinct
    on QueryBuilder<FavoritesItem, FavoritesItem, QDistinct> {
  QueryBuilder<FavoritesItem, FavoritesItem, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QDistinct> distinctBySymbols() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbols');
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QDistinct> distinctByUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedAt');
    });
  }

  QueryBuilder<FavoritesItem, FavoritesItem, QDistinct> distinctByWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'words');
    });
  }
}

extension FavoritesItemQueryProperty
    on QueryBuilder<FavoritesItem, FavoritesItem, QQueryProperty> {
  QueryBuilder<FavoritesItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavoritesItem, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<FavoritesItem, List<String>, QQueryOperations>
      symbolsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbols');
    });
  }

  QueryBuilder<FavoritesItem, DateTime?, QQueryOperations> usedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedAt');
    });
  }

  QueryBuilder<FavoritesItem, List<String>, QQueryOperations> wordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'words');
    });
  }
}
