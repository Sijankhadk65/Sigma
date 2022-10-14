// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Issue> _$issueSerializer = new _$IssueSerializer();

class _$IssueSerializer implements StructuredSerializer<Issue> {
  @override
  final Iterable<Type> types = const [Issue, _$Issue];
  @override
  final String wireName = 'Issue';

  @override
  Iterable<Object?> serialize(Serializers serializers, Issue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'is_closed',
      serializers.serialize(object.is_closed,
          specifiedType: const FullType(int)),
      'description',
      serializers.serialize(object.description,
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
    value = object.ticket_id;
    if (value != null) {
      result
        ..add('ticket_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Issue deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IssueBuilder();

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
        case 'ticket_id':
          result.ticket_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_closed':
          result.is_closed = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Issue extends Issue {
  @override
  final String? id;
  @override
  final String created_at;
  @override
  final String? ticket_id;
  @override
  final int is_closed;
  @override
  final String description;

  factory _$Issue([void Function(IssueBuilder)? updates]) =>
      (new IssueBuilder()..update(updates))._build();

  _$Issue._(
      {this.id,
      required this.created_at,
      this.ticket_id,
      required this.is_closed,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(created_at, r'Issue', 'created_at');
    BuiltValueNullFieldError.checkNotNull(is_closed, r'Issue', 'is_closed');
    BuiltValueNullFieldError.checkNotNull(description, r'Issue', 'description');
  }

  @override
  Issue rebuild(void Function(IssueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IssueBuilder toBuilder() => new IssueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Issue &&
        id == other.id &&
        created_at == other.created_at &&
        ticket_id == other.ticket_id &&
        is_closed == other.is_closed &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), created_at.hashCode),
                ticket_id.hashCode),
            is_closed.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Issue')
          ..add('id', id)
          ..add('created_at', created_at)
          ..add('ticket_id', ticket_id)
          ..add('is_closed', is_closed)
          ..add('description', description))
        .toString();
  }
}

class IssueBuilder implements Builder<Issue, IssueBuilder> {
  _$Issue? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _ticket_id;
  String? get ticket_id => _$this._ticket_id;
  set ticket_id(String? ticket_id) => _$this._ticket_id = ticket_id;

  int? _is_closed;
  int? get is_closed => _$this._is_closed;
  set is_closed(int? is_closed) => _$this._is_closed = is_closed;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  IssueBuilder();

  IssueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _created_at = $v.created_at;
      _ticket_id = $v.ticket_id;
      _is_closed = $v.is_closed;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Issue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Issue;
  }

  @override
  void update(void Function(IssueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Issue build() => _build();

  _$Issue _build() {
    final _$result = _$v ??
        new _$Issue._(
            id: id,
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, r'Issue', 'created_at'),
            ticket_id: ticket_id,
            is_closed: BuiltValueNullFieldError.checkNotNull(
                is_closed, r'Issue', 'is_closed'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'Issue', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
