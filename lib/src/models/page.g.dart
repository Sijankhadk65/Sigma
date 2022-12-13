// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Page<Object?>> _$pageSerializer = new _$PageSerializer();

class _$PageSerializer implements StructuredSerializer<Page<Object?>> {
  @override
  final Iterable<Type> types = const [Page, _$Page];
  @override
  final String wireName = 'Page';

  @override
  Iterable<Object?> serialize(Serializers serializers, Page<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'current_page',
      serializers.serialize(object.current_page,
          specifiedType: const FullType(int)),
      'last_page',
      serializers.serialize(object.last_page,
          specifiedType: const FullType(int)),
      'data',
      serializers.serialize(object.data,
          specifiedType: new FullType(List, [parameterT])),
    ];

    return result;
  }

  @override
  Page<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new PageBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as PageBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current_page':
          result.current_page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'last_page':
          result.last_page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: new FullType(List, [parameterT]))! as List<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$Page<T> extends Page<T> {
  @override
  final int current_page;
  @override
  final int last_page;
  @override
  final List<T> data;

  factory _$Page([void Function(PageBuilder<T>)? updates]) =>
      (new PageBuilder<T>()..update(updates))._build();

  _$Page._(
      {required this.current_page, required this.last_page, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        current_page, r'Page', 'current_page');
    BuiltValueNullFieldError.checkNotNull(last_page, r'Page', 'last_page');
    BuiltValueNullFieldError.checkNotNull(data, r'Page', 'data');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'Page', 'T');
    }
  }

  @override
  Page<T> rebuild(void Function(PageBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageBuilder<T> toBuilder() => new PageBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Page &&
        current_page == other.current_page &&
        last_page == other.last_page &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, current_page.hashCode), last_page.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Page')
          ..add('current_page', current_page)
          ..add('last_page', last_page)
          ..add('data', data))
        .toString();
  }
}

class PageBuilder<T> implements Builder<Page<T>, PageBuilder<T>> {
  _$Page<T>? _$v;

  int? _current_page;
  int? get current_page => _$this._current_page;
  set current_page(int? current_page) => _$this._current_page = current_page;

  int? _last_page;
  int? get last_page => _$this._last_page;
  set last_page(int? last_page) => _$this._last_page = last_page;

  List<T>? _data;
  List<T>? get data => _$this._data;
  set data(List<T>? data) => _$this._data = data;

  PageBuilder();

  PageBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _current_page = $v.current_page;
      _last_page = $v.last_page;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Page<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Page<T>;
  }

  @override
  void update(void Function(PageBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Page<T> build() => _build();

  _$Page<T> _build() {
    final _$result = _$v ??
        new _$Page<T>._(
            current_page: BuiltValueNullFieldError.checkNotNull(
                current_page, r'Page', 'current_page'),
            last_page: BuiltValueNullFieldError.checkNotNull(
                last_page, r'Page', 'last_page'),
            data: BuiltValueNullFieldError.checkNotNull(data, r'Page', 'data'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
