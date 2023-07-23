// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rates_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRatesCollectionItemCollection on Isar {
  IsarCollection<RatesCollectionItem> get ratesCollectionItems =>
      this.collection();
}

const RatesCollectionItemSchema = CollectionSchema(
  name: r'currency_rates',
  id: -5297317258856645124,
  properties: {
    r'lastUsedAt': PropertySchema(
      id: 0,
      name: r'lastUsedAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 2,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'usdPrice': PropertySchema(
      id: 4,
      name: r'usdPrice',
      type: IsarType.double,
    ),
    r'words': PropertySchema(
      id: 5,
      name: r'words',
      type: IsarType.stringList,
    )
  },
  estimateSize: _ratesCollectionItemEstimateSize,
  serialize: _ratesCollectionItemSerialize,
  deserialize: _ratesCollectionItemDeserialize,
  deserializeProp: _ratesCollectionItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'symbol': IndexSchema(
      id: -7050953154795990356,
      name: r'symbol',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'symbol',
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
  getId: _ratesCollectionItemGetId,
  getLinks: _ratesCollectionItemGetLinks,
  attach: _ratesCollectionItemAttach,
  version: '3.1.0+1',
);

int _ratesCollectionItemEstimateSize(
  RatesCollectionItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.symbol.length * 3;
  bytesCount += 3 + object.words.length * 3;
  {
    for (var i = 0; i < object.words.length; i++) {
      final value = object.words[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _ratesCollectionItemSerialize(
  RatesCollectionItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastUsedAt);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.symbol);
  writer.writeDateTime(offsets[3], object.updatedAt);
  writer.writeDouble(offsets[4], object.usdPrice);
  writer.writeStringList(offsets[5], object.words);
}

RatesCollectionItem _ratesCollectionItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RatesCollectionItem();
  object.id = id;
  object.lastUsedAt = reader.readDateTime(offsets[0]);
  object.name = reader.readStringOrNull(offsets[1]);
  object.symbol = reader.readString(offsets[2]);
  object.updatedAt = reader.readDateTime(offsets[3]);
  object.usdPrice = reader.readDoubleOrNull(offsets[4]);
  return object;
}

P _ratesCollectionItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ratesCollectionItemGetId(RatesCollectionItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ratesCollectionItemGetLinks(
    RatesCollectionItem object) {
  return [];
}

void _ratesCollectionItemAttach(
    IsarCollection<dynamic> col, Id id, RatesCollectionItem object) {
  object.id = id;
}

extension RatesCollectionItemByIndex on IsarCollection<RatesCollectionItem> {
  Future<RatesCollectionItem?> getBySymbol(String symbol) {
    return getByIndex(r'symbol', [symbol]);
  }

  RatesCollectionItem? getBySymbolSync(String symbol) {
    return getByIndexSync(r'symbol', [symbol]);
  }

  Future<bool> deleteBySymbol(String symbol) {
    return deleteByIndex(r'symbol', [symbol]);
  }

  bool deleteBySymbolSync(String symbol) {
    return deleteByIndexSync(r'symbol', [symbol]);
  }

  Future<List<RatesCollectionItem?>> getAllBySymbol(List<String> symbolValues) {
    final values = symbolValues.map((e) => [e]).toList();
    return getAllByIndex(r'symbol', values);
  }

  List<RatesCollectionItem?> getAllBySymbolSync(List<String> symbolValues) {
    final values = symbolValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'symbol', values);
  }

  Future<int> deleteAllBySymbol(List<String> symbolValues) {
    final values = symbolValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'symbol', values);
  }

  int deleteAllBySymbolSync(List<String> symbolValues) {
    final values = symbolValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'symbol', values);
  }

  Future<Id> putBySymbol(RatesCollectionItem object) {
    return putByIndex(r'symbol', object);
  }

  Id putBySymbolSync(RatesCollectionItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'symbol', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySymbol(List<RatesCollectionItem> objects) {
    return putAllByIndex(r'symbol', objects);
  }

  List<Id> putAllBySymbolSync(List<RatesCollectionItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'symbol', objects, saveLinks: saveLinks);
  }
}

extension RatesCollectionItemQueryWhereSort
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QWhere> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhere>
      anyWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'words'),
      );
    });
  }
}

extension RatesCollectionItemQueryWhere
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QWhereClause> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      symbolEqualTo(String symbol) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'symbol',
        value: [symbol],
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      symbolNotEqualTo(String symbol) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbol',
              lower: [],
              upper: [symbol],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbol',
              lower: [symbol],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbol',
              lower: [symbol],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'symbol',
              lower: [],
              upper: [symbol],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      wordsElementEqualTo(String wordsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'words',
        value: [wordsElement],
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      wordsElementStartsWith(String WordsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'words',
        lower: [WordsElementPrefix],
        upper: ['$WordsElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
      wordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'words',
        value: [''],
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterWhereClause>
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

extension RatesCollectionItemQueryFilter on QueryBuilder<RatesCollectionItem,
    RatesCollectionItem, QFilterCondition> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      lastUsedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      lastUsedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      lastUsedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      lastUsedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usdPrice',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usdPrice',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usdPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usdPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usdPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      usdPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usdPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      wordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'words',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      wordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'words',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      wordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'words',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
      wordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'words',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterFilterCondition>
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

extension RatesCollectionItemQueryObject on QueryBuilder<RatesCollectionItem,
    RatesCollectionItem, QFilterCondition> {}

extension RatesCollectionItemQueryLinks on QueryBuilder<RatesCollectionItem,
    RatesCollectionItem, QFilterCondition> {}

extension RatesCollectionItemQuerySortBy
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QSortBy> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByUsdPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usdPrice', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      sortByUsdPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usdPrice', Sort.desc);
    });
  }
}

extension RatesCollectionItemQuerySortThenBy
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QSortThenBy> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByUsdPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usdPrice', Sort.asc);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QAfterSortBy>
      thenByUsdPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usdPrice', Sort.desc);
    });
  }
}

extension RatesCollectionItemQueryWhereDistinct
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct> {
  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsedAt');
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctBySymbol({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctByUsdPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usdPrice');
    });
  }

  QueryBuilder<RatesCollectionItem, RatesCollectionItem, QDistinct>
      distinctByWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'words');
    });
  }
}

extension RatesCollectionItemQueryProperty
    on QueryBuilder<RatesCollectionItem, RatesCollectionItem, QQueryProperty> {
  QueryBuilder<RatesCollectionItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RatesCollectionItem, DateTime, QQueryOperations>
      lastUsedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsedAt');
    });
  }

  QueryBuilder<RatesCollectionItem, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RatesCollectionItem, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<RatesCollectionItem, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RatesCollectionItem, double?, QQueryOperations>
      usdPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usdPrice');
    });
  }

  QueryBuilder<RatesCollectionItem, List<String>, QQueryOperations>
      wordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'words');
    });
  }
}
