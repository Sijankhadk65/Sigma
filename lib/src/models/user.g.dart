// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'fname',
      serializers.serialize(object.fname,
          specifiedType: const FullType(String)),
      'lname',
      serializers.serialize(object.lname,
          specifiedType: const FullType(String)),
      'center_id',
      serializers.serialize(object.center_id,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'contact_no',
      serializers.serialize(object.contact_no,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fname':
          result.fname = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lname':
          result.lname = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'center_id':
          result.center_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'contact_no':
          result.contact_no = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final String username;
  @override
  final String? password;
  @override
  final String role;
  @override
  final String fname;
  @override
  final String lname;
  @override
  final String center_id;
  @override
  final String address;
  @override
  final String email;
  @override
  final int contact_no;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {required this.id,
      required this.username,
      this.password,
      required this.role,
      required this.fname,
      required this.lname,
      required this.center_id,
      required this.address,
      required this.email,
      required this.contact_no})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'User', 'id');
    BuiltValueNullFieldError.checkNotNull(username, r'User', 'username');
    BuiltValueNullFieldError.checkNotNull(role, r'User', 'role');
    BuiltValueNullFieldError.checkNotNull(fname, r'User', 'fname');
    BuiltValueNullFieldError.checkNotNull(lname, r'User', 'lname');
    BuiltValueNullFieldError.checkNotNull(center_id, r'User', 'center_id');
    BuiltValueNullFieldError.checkNotNull(address, r'User', 'address');
    BuiltValueNullFieldError.checkNotNull(email, r'User', 'email');
    BuiltValueNullFieldError.checkNotNull(contact_no, r'User', 'contact_no');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        username == other.username &&
        password == other.password &&
        role == other.role &&
        fname == other.fname &&
        lname == other.lname &&
        center_id == other.center_id &&
        address == other.address &&
        email == other.email &&
        contact_no == other.contact_no;
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
                                $jc($jc($jc(0, id.hashCode), username.hashCode),
                                    password.hashCode),
                                role.hashCode),
                            fname.hashCode),
                        lname.hashCode),
                    center_id.hashCode),
                address.hashCode),
            email.hashCode),
        contact_no.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('username', username)
          ..add('password', password)
          ..add('role', role)
          ..add('fname', fname)
          ..add('lname', lname)
          ..add('center_id', center_id)
          ..add('address', address)
          ..add('email', email)
          ..add('contact_no', contact_no))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _fname;
  String? get fname => _$this._fname;
  set fname(String? fname) => _$this._fname = fname;

  String? _lname;
  String? get lname => _$this._lname;
  set lname(String? lname) => _$this._lname = lname;

  String? _center_id;
  String? get center_id => _$this._center_id;
  set center_id(String? center_id) => _$this._center_id = center_id;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  int? _contact_no;
  int? get contact_no => _$this._contact_no;
  set contact_no(int? contact_no) => _$this._contact_no = contact_no;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _password = $v.password;
      _role = $v.role;
      _fname = $v.fname;
      _lname = $v.lname;
      _center_id = $v.center_id;
      _address = $v.address;
      _email = $v.email;
      _contact_no = $v.contact_no;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    final _$result = _$v ??
        new _$User._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'User', 'id'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'User', 'username'),
            password: password,
            role: BuiltValueNullFieldError.checkNotNull(role, r'User', 'role'),
            fname:
                BuiltValueNullFieldError.checkNotNull(fname, r'User', 'fname'),
            lname:
                BuiltValueNullFieldError.checkNotNull(lname, r'User', 'lname'),
            center_id: BuiltValueNullFieldError.checkNotNull(
                center_id, r'User', 'center_id'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'User', 'address'),
            email:
                BuiltValueNullFieldError.checkNotNull(email, r'User', 'email'),
            contact_no: BuiltValueNullFieldError.checkNotNull(
                contact_no, r'User', 'contact_no'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
