// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Expense> _$expenseSerializer = new _$ExpenseSerializer();

class _$ExpenseSerializer implements StructuredSerializer<Expense> {
  @override
  final Iterable<Type> types = const [Expense, _$Expense];
  @override
  final String wireName = 'Expense';

  @override
  Iterable<Object?> serialize(Serializers serializers, Expense object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ticket_id',
      serializers.serialize(object.ticket_id,
          specifiedType: const FullType(String)),
      'item_name',
      serializers.serialize(object.item_name,
          specifiedType: const FullType(String)),
      'cost',
      serializers.serialize(object.cost, specifiedType: const FullType(double)),
      'unit_price',
      serializers.serialize(object.unit_price,
          specifiedType: const FullType(double)),
      'created_by',
      serializers.serialize(object.created_by,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'item_id',
      serializers.serialize(object.item_id,
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
  Expense deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExpenseBuilder();

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
        case 'ticket_id':
          result.ticket_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'item_name':
          result.item_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'unit_price':
          result.unit_price = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'created_by':
          result.created_by = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'item_id':
          result.item_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Expense extends Expense {
  @override
  final String? id;
  @override
  final String ticket_id;
  @override
  final String item_name;
  @override
  final double cost;
  @override
  final double unit_price;
  @override
  final String created_by;
  @override
  final String created_at;
  @override
  final int quantity;
  @override
  final String item_id;

  factory _$Expense([void Function(ExpenseBuilder)? updates]) =>
      (new ExpenseBuilder()..update(updates))._build();

  _$Expense._(
      {this.id,
      required this.ticket_id,
      required this.item_name,
      required this.cost,
      required this.unit_price,
      required this.created_by,
      required this.created_at,
      required this.quantity,
      required this.item_id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ticket_id, r'Expense', 'ticket_id');
    BuiltValueNullFieldError.checkNotNull(item_name, r'Expense', 'item_name');
    BuiltValueNullFieldError.checkNotNull(cost, r'Expense', 'cost');
    BuiltValueNullFieldError.checkNotNull(unit_price, r'Expense', 'unit_price');
    BuiltValueNullFieldError.checkNotNull(created_by, r'Expense', 'created_by');
    BuiltValueNullFieldError.checkNotNull(created_at, r'Expense', 'created_at');
    BuiltValueNullFieldError.checkNotNull(quantity, r'Expense', 'quantity');
    BuiltValueNullFieldError.checkNotNull(item_id, r'Expense', 'item_id');
  }

  @override
  Expense rebuild(void Function(ExpenseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExpenseBuilder toBuilder() => new ExpenseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Expense &&
        id == other.id &&
        ticket_id == other.ticket_id &&
        item_name == other.item_name &&
        cost == other.cost &&
        unit_price == other.unit_price &&
        created_by == other.created_by &&
        created_at == other.created_at &&
        quantity == other.quantity &&
        item_id == other.item_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), ticket_id.hashCode),
                                item_name.hashCode),
                            cost.hashCode),
                        unit_price.hashCode),
                    created_by.hashCode),
                created_at.hashCode),
            quantity.hashCode),
        item_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Expense')
          ..add('id', id)
          ..add('ticket_id', ticket_id)
          ..add('item_name', item_name)
          ..add('cost', cost)
          ..add('unit_price', unit_price)
          ..add('created_by', created_by)
          ..add('created_at', created_at)
          ..add('quantity', quantity)
          ..add('item_id', item_id))
        .toString();
  }
}

class ExpenseBuilder implements Builder<Expense, ExpenseBuilder> {
  _$Expense? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _ticket_id;
  String? get ticket_id => _$this._ticket_id;
  set ticket_id(String? ticket_id) => _$this._ticket_id = ticket_id;

  String? _item_name;
  String? get item_name => _$this._item_name;
  set item_name(String? item_name) => _$this._item_name = item_name;

  double? _cost;
  double? get cost => _$this._cost;
  set cost(double? cost) => _$this._cost = cost;

  double? _unit_price;
  double? get unit_price => _$this._unit_price;
  set unit_price(double? unit_price) => _$this._unit_price = unit_price;

  String? _created_by;
  String? get created_by => _$this._created_by;
  set created_by(String? created_by) => _$this._created_by = created_by;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  String? _item_id;
  String? get item_id => _$this._item_id;
  set item_id(String? item_id) => _$this._item_id = item_id;

  ExpenseBuilder();

  ExpenseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ticket_id = $v.ticket_id;
      _item_name = $v.item_name;
      _cost = $v.cost;
      _unit_price = $v.unit_price;
      _created_by = $v.created_by;
      _created_at = $v.created_at;
      _quantity = $v.quantity;
      _item_id = $v.item_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Expense other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Expense;
  }

  @override
  void update(void Function(ExpenseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Expense build() => _build();

  _$Expense _build() {
    final _$result = _$v ??
        new _$Expense._(
            id: id,
            ticket_id: BuiltValueNullFieldError.checkNotNull(
                ticket_id, r'Expense', 'ticket_id'),
            item_name: BuiltValueNullFieldError.checkNotNull(
                item_name, r'Expense', 'item_name'),
            cost:
                BuiltValueNullFieldError.checkNotNull(cost, r'Expense', 'cost'),
            unit_price: BuiltValueNullFieldError.checkNotNull(
                unit_price, r'Expense', 'unit_price'),
            created_by: BuiltValueNullFieldError.checkNotNull(
                created_by, r'Expense', 'created_by'),
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'Expense', 'created_at'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'Expense', 'quantity'),
            item_id: BuiltValueNullFieldError.checkNotNull(
                item_id, r'Expense', 'item_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
