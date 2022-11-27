// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StockItem> _$stockItemSerializer = new _$StockItemSerializer();

class _$StockItemSerializer implements StructuredSerializer<StockItem> {
  @override
  final Iterable<Type> types = const [StockItem, _$StockItem];
  @override
  final String wireName = 'StockItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, StockItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'center_id',
      serializers.serialize(object.center_id,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'created_by',
      serializers.serialize(object.created_by,
          specifiedType: const FullType(String)),
      'unit_price',
      serializers.serialize(object.unit_price,
          specifiedType: const FullType(double)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'item_name',
      serializers.serialize(object.item_name,
          specifiedType: const FullType(String)),
      'item_photo_uri',
      serializers.serialize(object.item_photo_uri,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  StockItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StockItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'center_id':
          result.center_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_by':
          result.created_by = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'unit_price':
          result.unit_price = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'item_name':
          result.item_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'item_photo_uri':
          result.item_photo_uri = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StockItem extends StockItem {
  @override
  final String? id;
  @override
  final String center_id;
  @override
  final String created_at;
  @override
  final String created_by;
  @override
  final double unit_price;
  @override
  final int quantity;
  @override
  final String item_name;
  @override
  final String item_photo_uri;

  factory _$StockItem([void Function(StockItemBuilder)? updates]) =>
      (new StockItemBuilder()..update(updates))._build();

  _$StockItem._(
      {this.id,
      required this.center_id,
      required this.created_at,
      required this.created_by,
      required this.unit_price,
      required this.quantity,
      required this.item_name,
      required this.item_photo_uri})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(center_id, r'StockItem', 'center_id');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'StockItem', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        created_by, r'StockItem', 'created_by');
    BuiltValueNullFieldError.checkNotNull(
        unit_price, r'StockItem', 'unit_price');
    BuiltValueNullFieldError.checkNotNull(quantity, r'StockItem', 'quantity');
    BuiltValueNullFieldError.checkNotNull(item_name, r'StockItem', 'item_name');
    BuiltValueNullFieldError.checkNotNull(
        item_photo_uri, r'StockItem', 'item_photo_uri');
  }

  @override
  StockItem rebuild(void Function(StockItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockItemBuilder toBuilder() => new StockItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockItem &&
        id == other.id &&
        center_id == other.center_id &&
        created_at == other.created_at &&
        created_by == other.created_by &&
        unit_price == other.unit_price &&
        quantity == other.quantity &&
        item_name == other.item_name &&
        item_photo_uri == other.item_photo_uri;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), center_id.hashCode),
                            created_at.hashCode),
                        created_by.hashCode),
                    unit_price.hashCode),
                quantity.hashCode),
            item_name.hashCode),
        item_photo_uri.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockItem')
          ..add('id', id)
          ..add('center_id', center_id)
          ..add('created_at', created_at)
          ..add('created_by', created_by)
          ..add('unit_price', unit_price)
          ..add('quantity', quantity)
          ..add('item_name', item_name)
          ..add('item_photo_uri', item_photo_uri))
        .toString();
  }
}

class StockItemBuilder implements Builder<StockItem, StockItemBuilder> {
  _$StockItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _center_id;
  String? get center_id => _$this._center_id;
  set center_id(String? center_id) => _$this._center_id = center_id;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _created_by;
  String? get created_by => _$this._created_by;
  set created_by(String? created_by) => _$this._created_by = created_by;

  double? _unit_price;
  double? get unit_price => _$this._unit_price;
  set unit_price(double? unit_price) => _$this._unit_price = unit_price;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _item_name;
  String? get item_name => _$this._item_name;
  set item_name(String? item_name) => _$this._item_name = item_name;

  String? _item_photo_uri;
  String? get item_photo_uri => _$this._item_photo_uri;
  set item_photo_uri(String? item_photo_uri) =>
      _$this._item_photo_uri = item_photo_uri;

  StockItemBuilder();

  StockItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _center_id = $v.center_id;
      _created_at = $v.created_at;
      _created_by = $v.created_by;
      _unit_price = $v.unit_price;
      _quantity = $v.quantity;
      _item_name = $v.item_name;
      _item_photo_uri = $v.item_photo_uri;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StockItem;
  }

  @override
  void update(void Function(StockItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockItem build() => _build();

  _$StockItem _build() {
    final _$result = _$v ??
        new _$StockItem._(
            id: id,
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'StockItem', 'center_id'),
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'StockItem', 'created_at'),
            created_by: BuiltValueNullFieldError.checkNotNull(
                created_by, r'StockItem', 'created_by'),
            unit_price: BuiltValueNullFieldError.checkNotNull(
                unit_price, r'StockItem', 'unit_price'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'StockItem', 'quantity'),
            item_name: BuiltValueNullFieldError.checkNotNull(
                item_name, r'StockItem', 'item_name'),
            item_photo_uri: BuiltValueNullFieldError.checkNotNull(
                item_photo_uri, r'StockItem', 'item_photo_uri'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
