// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Sales> _$salesSerializer = new _$SalesSerializer();

class _$SalesSerializer implements StructuredSerializer<Sales> {
  @override
  final Iterable<Type> types = const [Sales, _$Sales];
  @override
  final String wireName = 'Sales';

  @override
  Iterable<Object?> serialize(Serializers serializers, Sales object,
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
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'item_count',
      serializers.serialize(object.item_count,
          specifiedType: const FullType(int)),
      'payment_method',
      serializers.serialize(object.payment_method,
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
    value = object.customer_id;
    if (value != null) {
      result
        ..add('customer_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Sales deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SalesBuilder();

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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'item_count':
          result.item_count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'customer_id':
          result.customer_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_method':
          result.payment_method = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Sales extends Sales {
  @override
  final String? id;
  @override
  final String center_id;
  @override
  final String created_at;
  @override
  final String created_by;
  @override
  final double amount;
  @override
  final int item_count;
  @override
  final String? customer_id;
  @override
  final String payment_method;

  factory _$Sales([void Function(SalesBuilder)? updates]) =>
      (new SalesBuilder()..update(updates))._build();

  _$Sales._(
      {this.id,
      required this.center_id,
      required this.created_at,
      required this.created_by,
      required this.amount,
      required this.item_count,
      this.customer_id,
      required this.payment_method})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(center_id, r'Sales', 'center_id');
    BuiltValueNullFieldError.checkNotNull(created_at, r'Sales', 'created_at');
    BuiltValueNullFieldError.checkNotNull(created_by, r'Sales', 'created_by');
    BuiltValueNullFieldError.checkNotNull(amount, r'Sales', 'amount');
    BuiltValueNullFieldError.checkNotNull(item_count, r'Sales', 'item_count');
    BuiltValueNullFieldError.checkNotNull(
        payment_method, r'Sales', 'payment_method');
  }

  @override
  Sales rebuild(void Function(SalesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesBuilder toBuilder() => new SalesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sales &&
        id == other.id &&
        center_id == other.center_id &&
        created_at == other.created_at &&
        created_by == other.created_by &&
        amount == other.amount &&
        item_count == other.item_count &&
        customer_id == other.customer_id &&
        payment_method == other.payment_method;
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
                    amount.hashCode),
                item_count.hashCode),
            customer_id.hashCode),
        payment_method.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Sales')
          ..add('id', id)
          ..add('center_id', center_id)
          ..add('created_at', created_at)
          ..add('created_by', created_by)
          ..add('amount', amount)
          ..add('item_count', item_count)
          ..add('customer_id', customer_id)
          ..add('payment_method', payment_method))
        .toString();
  }
}

class SalesBuilder implements Builder<Sales, SalesBuilder> {
  _$Sales? _$v;

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

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _item_count;
  int? get item_count => _$this._item_count;
  set item_count(int? item_count) => _$this._item_count = item_count;

  String? _customer_id;
  String? get customer_id => _$this._customer_id;
  set customer_id(String? customer_id) => _$this._customer_id = customer_id;

  String? _payment_method;
  String? get payment_method => _$this._payment_method;
  set payment_method(String? payment_method) =>
      _$this._payment_method = payment_method;

  SalesBuilder();

  SalesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _center_id = $v.center_id;
      _created_at = $v.created_at;
      _created_by = $v.created_by;
      _amount = $v.amount;
      _item_count = $v.item_count;
      _customer_id = $v.customer_id;
      _payment_method = $v.payment_method;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sales other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sales;
  }

  @override
  void update(void Function(SalesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sales build() => _build();

  _$Sales _build() {
    final _$result = _$v ??
        new _$Sales._(
            id: id,
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'Sales', 'center_id'),
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'Sales', 'created_at'),
            created_by: BuiltValueNullFieldError.checkNotNull(
                created_by, r'Sales', 'created_by'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Sales', 'amount'),
            item_count: BuiltValueNullFieldError.checkNotNull(
                item_count, r'Sales', 'item_count'),
            customer_id: customer_id,
            payment_method: BuiltValueNullFieldError.checkNotNull(
                payment_method, r'Sales', 'payment_method'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
