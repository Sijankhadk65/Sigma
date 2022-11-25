// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Transaction> _$transactionSerializer = new _$TransactionSerializer();

class _$TransactionSerializer implements StructuredSerializer<Transaction> {
  @override
  final Iterable<Type> types = const [Transaction, _$Transaction];
  @override
  final String wireName = 'Transaction';

  @override
  Iterable<Object?> serialize(Serializers serializers, Transaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'created_by',
      serializers.serialize(object.created_by,
          specifiedType: const FullType(String)),
      'transaction_at',
      serializers.serialize(object.transaction_at,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'center_id',
      serializers.serialize(object.center_id,
          specifiedType: const FullType(String)),
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
    return result;
  }

  @override
  Transaction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionBuilder();

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
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_by':
          result.created_by = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'transaction_at':
          result.transaction_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'center_id':
          result.center_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$Transaction extends Transaction {
  @override
  final String? id;
  @override
  final String created_at;
  @override
  final String created_by;
  @override
  final String transaction_at;
  @override
  final String type;
  @override
  final String source;
  @override
  final String description;
  @override
  final double amount;
  @override
  final String center_id;
  @override
  final String payment_method;

  factory _$Transaction([void Function(TransactionBuilder)? updates]) =>
      (new TransactionBuilder()..update(updates))._build();

  _$Transaction._(
      {this.id,
      required this.created_at,
      required this.created_by,
      required this.transaction_at,
      required this.type,
      required this.source,
      required this.description,
      required this.amount,
      required this.center_id,
      required this.payment_method})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        created_at, r'Transaction', 'created_at');
    BuiltValueNullFieldError.checkNotNull(
        created_by, r'Transaction', 'created_by');
    BuiltValueNullFieldError.checkNotNull(
        transaction_at, r'Transaction', 'transaction_at');
    BuiltValueNullFieldError.checkNotNull(type, r'Transaction', 'type');
    BuiltValueNullFieldError.checkNotNull(source, r'Transaction', 'source');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Transaction', 'description');
    BuiltValueNullFieldError.checkNotNull(amount, r'Transaction', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        center_id, r'Transaction', 'center_id');
    BuiltValueNullFieldError.checkNotNull(
        payment_method, r'Transaction', 'payment_method');
  }

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => new TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        id == other.id &&
        created_at == other.created_at &&
        created_by == other.created_by &&
        transaction_at == other.transaction_at &&
        type == other.type &&
        source == other.source &&
        description == other.description &&
        amount == other.amount &&
        center_id == other.center_id &&
        payment_method == other.payment_method;
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
                                        created_at.hashCode),
                                    created_by.hashCode),
                                transaction_at.hashCode),
                            type.hashCode),
                        source.hashCode),
                    description.hashCode),
                amount.hashCode),
            center_id.hashCode),
        payment_method.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Transaction')
          ..add('id', id)
          ..add('created_at', created_at)
          ..add('created_by', created_by)
          ..add('transaction_at', transaction_at)
          ..add('type', type)
          ..add('source', source)
          ..add('description', description)
          ..add('amount', amount)
          ..add('center_id', center_id)
          ..add('payment_method', payment_method))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _created_by;
  String? get created_by => _$this._created_by;
  set created_by(String? created_by) => _$this._created_by = created_by;

  String? _transaction_at;
  String? get transaction_at => _$this._transaction_at;
  set transaction_at(String? transaction_at) =>
      _$this._transaction_at = transaction_at;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _center_id;
  String? get center_id => _$this._center_id;
  set center_id(String? center_id) => _$this._center_id = center_id;

  String? _payment_method;
  String? get payment_method => _$this._payment_method;
  set payment_method(String? payment_method) =>
      _$this._payment_method = payment_method;

  TransactionBuilder();

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _created_at = $v.created_at;
      _created_by = $v.created_by;
      _transaction_at = $v.transaction_at;
      _type = $v.type;
      _source = $v.source;
      _description = $v.description;
      _amount = $v.amount;
      _center_id = $v.center_id;
      _payment_method = $v.payment_method;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transaction build() => _build();

  _$Transaction _build() {
    final _$result = _$v ??
        new _$Transaction._(
            id: id,
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'Transaction', 'created_at'),
            created_by: BuiltValueNullFieldError.checkNotNull(
                created_by, r'Transaction', 'created_by'),
            transaction_at: BuiltValueNullFieldError.checkNotNull(
                transaction_at, r'Transaction', 'transaction_at'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'Transaction', 'type'),
            source: BuiltValueNullFieldError.checkNotNull(
                source, r'Transaction', 'source'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'Transaction', 'description'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Transaction', 'amount'),
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'Transaction', 'center_id'),
            payment_method: BuiltValueNullFieldError.checkNotNull(
                payment_method, r'Transaction', 'payment_method'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
