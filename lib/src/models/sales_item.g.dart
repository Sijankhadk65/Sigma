// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SalesItem> _$salesItemSerializer = new _$SalesItemSerializer();

class _$SalesItemSerializer implements StructuredSerializer<SalesItem> {
  @override
  final Iterable<Type> types = const [SalesItem, _$SalesItem];
  @override
  final String wireName = 'SalesItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, SalesItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'center_id',
      serializers.serialize(object.center_id,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'item_name',
      serializers.serialize(object.item_name,
          specifiedType: const FullType(String)),
      'item_id',
      serializers.serialize(object.item_id,
          specifiedType: const FullType(String)),
      'item_photo_uri',
      serializers.serialize(object.item_photo_uri,
          specifiedType: const FullType(String)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'unit_price',
      serializers.serialize(object.unit_price,
          specifiedType: const FullType(double)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(double)),
      'sales_id',
      serializers.serialize(object.sales_id,
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
  SalesItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SalesItemBuilder();

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
        case 'item_name':
          result.item_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'item_id':
          result.item_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'item_photo_uri':
          result.item_photo_uri = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit_price':
          result.unit_price = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'sales_id':
          result.sales_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SalesItem extends SalesItem {
  @override
  final String? id;
  @override
  final String center_id;
  @override
  final String created_at;
  @override
  final String item_name;
  @override
  final String item_id;
  @override
  final String item_photo_uri;
  @override
  final int quantity;
  @override
  final double unit_price;
  @override
  final double total;
  @override
  final String sales_id;

  factory _$SalesItem([void Function(SalesItemBuilder)? updates]) =>
      (new SalesItemBuilder()..update(updates))._build();

  _$SalesItem._(
      {this.id,
      required this.center_id,
      required this.created_at,
      required this.item_name,
      required this.item_id,
      required this.item_photo_uri,
      required this.quantity,
      required this.unit_price,
      required this.total,
      required this.sales_id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(center_id, r'SalesItem', 'center_id');
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'SalesItem', 'created_at');
    BuiltValueNullFieldError.checkNotNull(item_name, r'SalesItem', 'item_name');
    BuiltValueNullFieldError.checkNotNull(item_id, r'SalesItem', 'item_id');
    BuiltValueNullFieldError.checkNotNull(
        item_photo_uri, r'SalesItem', 'item_photo_uri');
    BuiltValueNullFieldError.checkNotNull(quantity, r'SalesItem', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        unit_price, r'SalesItem', 'unit_price');
    BuiltValueNullFieldError.checkNotNull(total, r'SalesItem', 'total');
    BuiltValueNullFieldError.checkNotNull(sales_id, r'SalesItem', 'sales_id');
  }

  @override
  SalesItem rebuild(void Function(SalesItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesItemBuilder toBuilder() => new SalesItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesItem &&
        id == other.id &&
        center_id == other.center_id &&
        created_at == other.created_at &&
        item_name == other.item_name &&
        item_id == other.item_id &&
        item_photo_uri == other.item_photo_uri &&
        quantity == other.quantity &&
        unit_price == other.unit_price &&
        total == other.total &&
        sales_id == other.sales_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        center_id.hashCode),
                                    created_at.hashCode),
                                item_name.hashCode),
                            item_id.hashCode),
                        item_photo_uri.hashCode),
                    quantity.hashCode),
                unit_price.hashCode),
            total.hashCode),
        sales_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesItem')
          ..add('id', id)
          ..add('center_id', center_id)
          ..add('created_at', created_at)
          ..add('item_name', item_name)
          ..add('item_id', item_id)
          ..add('item_photo_uri', item_photo_uri)
          ..add('quantity', quantity)
          ..add('unit_price', unit_price)
          ..add('total', total)
          ..add('sales_id', sales_id))
        .toString();
  }
}

class SalesItemBuilder implements Builder<SalesItem, SalesItemBuilder> {
  _$SalesItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _center_id;
  String? get center_id => _$this._center_id;
  set center_id(String? center_id) => _$this._center_id = center_id;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _item_name;
  String? get item_name => _$this._item_name;
  set item_name(String? item_name) => _$this._item_name = item_name;

  String? _item_id;
  String? get item_id => _$this._item_id;
  set item_id(String? item_id) => _$this._item_id = item_id;

  String? _item_photo_uri;
  String? get item_photo_uri => _$this._item_photo_uri;
  set item_photo_uri(String? item_photo_uri) =>
      _$this._item_photo_uri = item_photo_uri;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _unit_price;
  double? get unit_price => _$this._unit_price;
  set unit_price(double? unit_price) => _$this._unit_price = unit_price;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  String? _sales_id;
  String? get sales_id => _$this._sales_id;
  set sales_id(String? sales_id) => _$this._sales_id = sales_id;

  SalesItemBuilder();

  SalesItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _center_id = $v.center_id;
      _created_at = $v.created_at;
      _item_name = $v.item_name;
      _item_id = $v.item_id;
      _item_photo_uri = $v.item_photo_uri;
      _quantity = $v.quantity;
      _unit_price = $v.unit_price;
      _total = $v.total;
      _sales_id = $v.sales_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SalesItem;
  }

  @override
  void update(void Function(SalesItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesItem build() => _build();

  _$SalesItem _build() {
    final _$result = _$v ??
        new _$SalesItem._(
            id: id,
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'SalesItem', 'center_id'),
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'SalesItem', 'created_at'),
            item_name: BuiltValueNullFieldError.checkNotNull(
                item_name, r'SalesItem', 'item_name'),
            item_id: BuiltValueNullFieldError.checkNotNull(
                item_id, r'SalesItem', 'item_id'),
            item_photo_uri: BuiltValueNullFieldError.checkNotNull(
                item_photo_uri, r'SalesItem', 'item_photo_uri'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'SalesItem', 'quantity'),
            unit_price: BuiltValueNullFieldError.checkNotNull(
                unit_price, r'SalesItem', 'unit_price'),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'SalesItem', 'total'),
            sales_id: BuiltValueNullFieldError.checkNotNull(
                sales_id, r'SalesItem', 'sales_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
