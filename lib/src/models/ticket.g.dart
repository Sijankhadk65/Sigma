// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Ticket> _$ticketSerializer = new _$TicketSerializer();

class _$TicketSerializer implements StructuredSerializer<Ticket> {
  @override
  final Iterable<Type> types = const [Ticket, _$Ticket];
  @override
  final String wireName = 'Ticket';

  @override
  Iterable<Object?> serialize(Serializers serializers, Ticket object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'device_manufacturer',
      serializers.serialize(object.device_manufacturer,
          specifiedType: const FullType(String)),
      'device_model',
      serializers.serialize(object.device_model,
          specifiedType: const FullType(String)),
      'opened_by',
      serializers.serialize(object.opened_by,
          specifiedType: const FullType(String)),
      'center_id',
      serializers.serialize(object.center_id,
          specifiedType: const FullType(String)),
      'is_closed',
      serializers.serialize(object.is_closed,
          specifiedType: const FullType(int)),
      'is_payment_due',
      serializers.serialize(object.is_payment_due,
          specifiedType: const FullType(int)),
      'opened_at',
      serializers.serialize(object.opened_at,
          specifiedType: const FullType(String)),
      'issue_count',
      serializers.serialize(object.issue_count,
          specifiedType: const FullType(int)),
      'open_issue',
      serializers.serialize(object.open_issue,
          specifiedType: const FullType(int)),
      'closed_issue',
      serializers.serialize(object.closed_issue,
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
    value = object.customer_id;
    if (value != null) {
      result
        ..add('customer_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviced_by;
    if (value != null) {
      result
        ..add('serviced_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.closed_at;
    if (value != null) {
      result
        ..add('closed_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.closed_by;
    if (value != null) {
      result
        ..add('closed_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total_service_cost;
    if (value != null) {
      result
        ..add('total_service_cost')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pay_recieved_by;
    if (value != null) {
      result
        ..add('pay_recieved_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paid_at;
    if (value != null) {
      result
        ..add('paid_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Ticket deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TicketBuilder();

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
        case 'device_manufacturer':
          result.device_manufacturer = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'device_model':
          result.device_model = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'opened_by':
          result.opened_by = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'center_id':
          result.center_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'customer_id':
          result.customer_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_closed':
          result.is_closed = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'is_payment_due':
          result.is_payment_due = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'serviced_by':
          result.serviced_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'closed_at':
          result.closed_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'opened_at':
          result.opened_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'closed_by':
          result.closed_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_service_cost':
          result.total_service_cost = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'issue_count':
          result.issue_count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'open_issue':
          result.open_issue = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'closed_issue':
          result.closed_issue = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pay_recieved_by':
          result.pay_recieved_by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paid_at':
          result.paid_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Ticket extends Ticket {
  @override
  final String? id;
  @override
  final String device_manufacturer;
  @override
  final String device_model;
  @override
  final String opened_by;
  @override
  final String center_id;
  @override
  final String? customer_id;
  @override
  final int is_closed;
  @override
  final int is_payment_due;
  @override
  final String? serviced_by;
  @override
  final String? closed_at;
  @override
  final String opened_at;
  @override
  final String? closed_by;
  @override
  final int? total_service_cost;
  @override
  final int issue_count;
  @override
  final int open_issue;
  @override
  final int closed_issue;
  @override
  final String? pay_recieved_by;
  @override
  final String? paid_at;

  factory _$Ticket([void Function(TicketBuilder)? updates]) =>
      (new TicketBuilder()..update(updates))._build();

  _$Ticket._(
      {this.id,
      required this.device_manufacturer,
      required this.device_model,
      required this.opened_by,
      required this.center_id,
      this.customer_id,
      required this.is_closed,
      required this.is_payment_due,
      this.serviced_by,
      this.closed_at,
      required this.opened_at,
      this.closed_by,
      this.total_service_cost,
      required this.issue_count,
      required this.open_issue,
      required this.closed_issue,
      this.pay_recieved_by,
      this.paid_at})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        device_manufacturer, r'Ticket', 'device_manufacturer');
    BuiltValueNullFieldError.checkNotNull(
        device_model, r'Ticket', 'device_model');
    BuiltValueNullFieldError.checkNotNull(opened_by, r'Ticket', 'opened_by');
    BuiltValueNullFieldError.checkNotNull(center_id, r'Ticket', 'center_id');
    BuiltValueNullFieldError.checkNotNull(is_closed, r'Ticket', 'is_closed');
    BuiltValueNullFieldError.checkNotNull(
        is_payment_due, r'Ticket', 'is_payment_due');
    BuiltValueNullFieldError.checkNotNull(opened_at, r'Ticket', 'opened_at');
    BuiltValueNullFieldError.checkNotNull(
        issue_count, r'Ticket', 'issue_count');
    BuiltValueNullFieldError.checkNotNull(open_issue, r'Ticket', 'open_issue');
    BuiltValueNullFieldError.checkNotNull(
        closed_issue, r'Ticket', 'closed_issue');
  }

  @override
  Ticket rebuild(void Function(TicketBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TicketBuilder toBuilder() => new TicketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ticket &&
        id == other.id &&
        device_manufacturer == other.device_manufacturer &&
        device_model == other.device_model &&
        opened_by == other.opened_by &&
        center_id == other.center_id &&
        customer_id == other.customer_id &&
        is_closed == other.is_closed &&
        is_payment_due == other.is_payment_due &&
        serviced_by == other.serviced_by &&
        closed_at == other.closed_at &&
        opened_at == other.opened_at &&
        closed_by == other.closed_by &&
        total_service_cost == other.total_service_cost &&
        issue_count == other.issue_count &&
        open_issue == other.open_issue &&
        closed_issue == other.closed_issue &&
        pay_recieved_by == other.pay_recieved_by &&
        paid_at == other.paid_at;
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        device_manufacturer
                                                                            .hashCode),
                                                                    device_model
                                                                        .hashCode),
                                                                opened_by
                                                                    .hashCode),
                                                            center_id.hashCode),
                                                        customer_id.hashCode),
                                                    is_closed.hashCode),
                                                is_payment_due.hashCode),
                                            serviced_by.hashCode),
                                        closed_at.hashCode),
                                    opened_at.hashCode),
                                closed_by.hashCode),
                            total_service_cost.hashCode),
                        issue_count.hashCode),
                    open_issue.hashCode),
                closed_issue.hashCode),
            pay_recieved_by.hashCode),
        paid_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Ticket')
          ..add('id', id)
          ..add('device_manufacturer', device_manufacturer)
          ..add('device_model', device_model)
          ..add('opened_by', opened_by)
          ..add('center_id', center_id)
          ..add('customer_id', customer_id)
          ..add('is_closed', is_closed)
          ..add('is_payment_due', is_payment_due)
          ..add('serviced_by', serviced_by)
          ..add('closed_at', closed_at)
          ..add('opened_at', opened_at)
          ..add('closed_by', closed_by)
          ..add('total_service_cost', total_service_cost)
          ..add('issue_count', issue_count)
          ..add('open_issue', open_issue)
          ..add('closed_issue', closed_issue)
          ..add('pay_recieved_by', pay_recieved_by)
          ..add('paid_at', paid_at))
        .toString();
  }
}

class TicketBuilder implements Builder<Ticket, TicketBuilder> {
  _$Ticket? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _device_manufacturer;
  String? get device_manufacturer => _$this._device_manufacturer;
  set device_manufacturer(String? device_manufacturer) =>
      _$this._device_manufacturer = device_manufacturer;

  String? _device_model;
  String? get device_model => _$this._device_model;
  set device_model(String? device_model) => _$this._device_model = device_model;

  String? _opened_by;
  String? get opened_by => _$this._opened_by;
  set opened_by(String? opened_by) => _$this._opened_by = opened_by;

  String? _center_id;
  String? get center_id => _$this._center_id;
  set center_id(String? center_id) => _$this._center_id = center_id;

  String? _customer_id;
  String? get customer_id => _$this._customer_id;
  set customer_id(String? customer_id) => _$this._customer_id = customer_id;

  int? _is_closed;
  int? get is_closed => _$this._is_closed;
  set is_closed(int? is_closed) => _$this._is_closed = is_closed;

  int? _is_payment_due;
  int? get is_payment_due => _$this._is_payment_due;
  set is_payment_due(int? is_payment_due) =>
      _$this._is_payment_due = is_payment_due;

  String? _serviced_by;
  String? get serviced_by => _$this._serviced_by;
  set serviced_by(String? serviced_by) => _$this._serviced_by = serviced_by;

  String? _closed_at;
  String? get closed_at => _$this._closed_at;
  set closed_at(String? closed_at) => _$this._closed_at = closed_at;

  String? _opened_at;
  String? get opened_at => _$this._opened_at;
  set opened_at(String? opened_at) => _$this._opened_at = opened_at;

  String? _closed_by;
  String? get closed_by => _$this._closed_by;
  set closed_by(String? closed_by) => _$this._closed_by = closed_by;

  int? _total_service_cost;
  int? get total_service_cost => _$this._total_service_cost;
  set total_service_cost(int? total_service_cost) =>
      _$this._total_service_cost = total_service_cost;

  int? _issue_count;
  int? get issue_count => _$this._issue_count;
  set issue_count(int? issue_count) => _$this._issue_count = issue_count;

  int? _open_issue;
  int? get open_issue => _$this._open_issue;
  set open_issue(int? open_issue) => _$this._open_issue = open_issue;

  int? _closed_issue;
  int? get closed_issue => _$this._closed_issue;
  set closed_issue(int? closed_issue) => _$this._closed_issue = closed_issue;

  String? _pay_recieved_by;
  String? get pay_recieved_by => _$this._pay_recieved_by;
  set pay_recieved_by(String? pay_recieved_by) =>
      _$this._pay_recieved_by = pay_recieved_by;

  String? _paid_at;
  String? get paid_at => _$this._paid_at;
  set paid_at(String? paid_at) => _$this._paid_at = paid_at;

  TicketBuilder();

  TicketBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _device_manufacturer = $v.device_manufacturer;
      _device_model = $v.device_model;
      _opened_by = $v.opened_by;
      _center_id = $v.center_id;
      _customer_id = $v.customer_id;
      _is_closed = $v.is_closed;
      _is_payment_due = $v.is_payment_due;
      _serviced_by = $v.serviced_by;
      _closed_at = $v.closed_at;
      _opened_at = $v.opened_at;
      _closed_by = $v.closed_by;
      _total_service_cost = $v.total_service_cost;
      _issue_count = $v.issue_count;
      _open_issue = $v.open_issue;
      _closed_issue = $v.closed_issue;
      _pay_recieved_by = $v.pay_recieved_by;
      _paid_at = $v.paid_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Ticket other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Ticket;
  }

  @override
  void update(void Function(TicketBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Ticket build() => _build();

  _$Ticket _build() {
    final _$result = _$v ??
        new _$Ticket._(
            id: id,
            device_manufacturer: BuiltValueNullFieldError.checkNotNull(
                device_manufacturer, r'Ticket', 'device_manufacturer'),
            device_model: BuiltValueNullFieldError.checkNotNull(
                device_model, r'Ticket', 'device_model'),
            opened_by: BuiltValueNullFieldError.checkNotNull(
                opened_by, r'Ticket', 'opened_by'),
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'Ticket', 'center_id'),
            customer_id: customer_id,
            is_closed: BuiltValueNullFieldError.checkNotNull(
                is_closed, r'Ticket', 'is_closed'),
            is_payment_due: BuiltValueNullFieldError.checkNotNull(
                is_payment_due, r'Ticket', 'is_payment_due'),
            serviced_by: serviced_by,
            closed_at: closed_at,
            opened_at: BuiltValueNullFieldError.checkNotNull(
                opened_at, r'Ticket', 'opened_at'),
            closed_by: closed_by,
            total_service_cost: total_service_cost,
            issue_count: BuiltValueNullFieldError.checkNotNull(
                issue_count, r'Ticket', 'issue_count'),
            open_issue: BuiltValueNullFieldError.checkNotNull(
                open_issue, r'Ticket', 'open_issue'),
            closed_issue: BuiltValueNullFieldError.checkNotNull(closed_issue, r'Ticket', 'closed_issue'),
            pay_recieved_by: pay_recieved_by,
            paid_at: paid_at);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
