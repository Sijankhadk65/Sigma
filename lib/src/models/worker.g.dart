// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Worker> _$workerSerializer = new _$WorkerSerializer();

class _$WorkerSerializer implements StructuredSerializer<Worker> {
  @override
  final Iterable<Type> types = const [Worker, _$Worker];
  @override
  final String wireName = 'Worker';

  @override
  Iterable<Object?> serialize(Serializers serializers, Worker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'ph_number',
      serializers.serialize(object.ph_number,
          specifiedType: const FullType(int)),
      'total_income',
      serializers.serialize(object.total_income,
          specifiedType: const FullType(int)),
      'total_services',
      serializers.serialize(object.total_services,
          specifiedType: const FullType(int)),
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
  Worker deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkerBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'ph_number':
          result.ph_number = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total_income':
          result.total_income = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total_services':
          result.total_services = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Worker extends Worker {
  @override
  final String? id;
  @override
  final String name;
  @override
  final String address;
  @override
  final int ph_number;
  @override
  final int total_income;
  @override
  final int total_services;

  factory _$Worker([void Function(WorkerBuilder)? updates]) =>
      (new WorkerBuilder()..update(updates))._build();

  _$Worker._(
      {this.id,
      required this.name,
      required this.address,
      required this.ph_number,
      required this.total_income,
      required this.total_services})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Worker', 'name');
    BuiltValueNullFieldError.checkNotNull(address, r'Worker', 'address');
    BuiltValueNullFieldError.checkNotNull(ph_number, r'Worker', 'ph_number');
    BuiltValueNullFieldError.checkNotNull(
        total_income, r'Worker', 'total_income');
    BuiltValueNullFieldError.checkNotNull(
        total_services, r'Worker', 'total_services');
  }

  @override
  Worker rebuild(void Function(WorkerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkerBuilder toBuilder() => new WorkerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Worker &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        ph_number == other.ph_number &&
        total_income == other.total_income &&
        total_services == other.total_services;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), address.hashCode),
                ph_number.hashCode),
            total_income.hashCode),
        total_services.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Worker')
          ..add('id', id)
          ..add('name', name)
          ..add('address', address)
          ..add('ph_number', ph_number)
          ..add('total_income', total_income)
          ..add('total_services', total_services))
        .toString();
  }
}

class WorkerBuilder implements Builder<Worker, WorkerBuilder> {
  _$Worker? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  int? _ph_number;
  int? get ph_number => _$this._ph_number;
  set ph_number(int? ph_number) => _$this._ph_number = ph_number;

  int? _total_income;
  int? get total_income => _$this._total_income;
  set total_income(int? total_income) => _$this._total_income = total_income;

  int? _total_services;
  int? get total_services => _$this._total_services;
  set total_services(int? total_services) =>
      _$this._total_services = total_services;

  WorkerBuilder();

  WorkerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _address = $v.address;
      _ph_number = $v.ph_number;
      _total_income = $v.total_income;
      _total_services = $v.total_services;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Worker other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Worker;
  }

  @override
  void update(void Function(WorkerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Worker build() => _build();

  _$Worker _build() {
    final _$result = _$v ??
        new _$Worker._(
            id: id,
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Worker', 'name'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'Worker', 'address'),
            ph_number: BuiltValueNullFieldError.checkNotNull(
                ph_number, r'Worker', 'ph_number'),
            total_income: BuiltValueNullFieldError.checkNotNull(
                total_income, r'Worker', 'total_income'),
            total_services: BuiltValueNullFieldError.checkNotNull(
                total_services, r'Worker', 'total_services'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
