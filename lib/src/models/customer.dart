import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  String? get id;
  String get name;
  String get address;
  int get ph_number;

  static Serializer<Customer> get serializer => _$customerSerializer;
  Customer._();
  factory Customer([void Function(CustomerBuilder) updates]) = _$Customer;

  static Customer parseJsonToCustomer(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(Customer.serializer, json)!;

  static Map<String, dynamic> parseCustomerToJson(Customer customer) => {
        "id": customer.id,
        "name": customer.name,
        "address": customer.address,
        "ph_number": customer.ph_number,
      };
}
