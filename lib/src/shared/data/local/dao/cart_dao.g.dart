// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dao.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartDaoCollection on Isar {
  IsarCollection<CartDao> get cartDaos => this.collection();
}

const CartDaoSchema = CollectionSchema(
  name: r'CartDao',
  id: -2652312054311846594,
  properties: {
    r'estimatePrice': PropertySchema(
      id: 0,
      name: r'estimatePrice',
      type: IsarType.double,
    ),
    r'productId': PropertySchema(
      id: 1,
      name: r'productId',
      type: IsarType.long,
    ),
    r'qty': PropertySchema(
      id: 2,
      name: r'qty',
      type: IsarType.long,
    )
  },
  estimateSize: _cartDaoEstimateSize,
  serialize: _cartDaoSerialize,
  deserialize: _cartDaoDeserialize,
  deserializeProp: _cartDaoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cartDaoGetId,
  getLinks: _cartDaoGetLinks,
  attach: _cartDaoAttach,
  version: '3.1.0+1',
);

int _cartDaoEstimateSize(
  CartDao object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cartDaoSerialize(
  CartDao object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.estimatePrice);
  writer.writeLong(offsets[1], object.productId);
  writer.writeLong(offsets[2], object.qty);
}

CartDao _cartDaoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartDao(
    estimatePrice: reader.readDouble(offsets[0]),
    productId: reader.readLong(offsets[1]),
    qty: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _cartDaoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cartDaoGetId(CartDao object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartDaoGetLinks(CartDao object) {
  return [];
}

void _cartDaoAttach(IsarCollection<dynamic> col, Id id, CartDao object) {
  object.id = id;
}

extension CartDaoQueryWhereSort on QueryBuilder<CartDao, CartDao, QWhere> {
  QueryBuilder<CartDao, CartDao, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CartDaoQueryWhere on QueryBuilder<CartDao, CartDao, QWhereClause> {
  QueryBuilder<CartDao, CartDao, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CartDao, CartDao, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterWhereClause> idBetween(
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
}

extension CartDaoQueryFilter
    on QueryBuilder<CartDao, CartDao, QFilterCondition> {
  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> estimatePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition>
      estimatePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> estimatePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> estimatePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> productIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> productIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> productIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> productIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> qtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> qtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> qtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty',
        value: value,
      ));
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterFilterCondition> qtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CartDaoQueryObject
    on QueryBuilder<CartDao, CartDao, QFilterCondition> {}

extension CartDaoQueryLinks
    on QueryBuilder<CartDao, CartDao, QFilterCondition> {}

extension CartDaoQuerySortBy on QueryBuilder<CartDao, CartDao, QSortBy> {
  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByEstimatePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatePrice', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByEstimatePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatePrice', Sort.desc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }
}

extension CartDaoQuerySortThenBy
    on QueryBuilder<CartDao, CartDao, QSortThenBy> {
  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByEstimatePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatePrice', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByEstimatePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatePrice', Sort.desc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CartDao, CartDao, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }
}

extension CartDaoQueryWhereDistinct
    on QueryBuilder<CartDao, CartDao, QDistinct> {
  QueryBuilder<CartDao, CartDao, QDistinct> distinctByEstimatePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatePrice');
    });
  }

  QueryBuilder<CartDao, CartDao, QDistinct> distinctByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId');
    });
  }

  QueryBuilder<CartDao, CartDao, QDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }
}

extension CartDaoQueryProperty
    on QueryBuilder<CartDao, CartDao, QQueryProperty> {
  QueryBuilder<CartDao, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartDao, double, QQueryOperations> estimatePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatePrice');
    });
  }

  QueryBuilder<CartDao, int, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<CartDao, int, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }
}
