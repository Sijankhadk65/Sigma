import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get id;
  String get username;
  String? get password;
  String get role;
  String get fname;
  String get lname;
  String get center_id;
  String get address;
  String get email;
  int get contact_no;

  static Serializer<User> get serializer => _$userSerializer;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;

  static User parseJsonToUser(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(User.serializer, json)!;

  static String parseUserToJson(User user) =>
      jsonSerializer.toJson(User.serializer, user);
}
