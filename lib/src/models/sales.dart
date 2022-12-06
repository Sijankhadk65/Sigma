import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'sales.g.dart';

abstract class Sales implements Built<Sales, SalesBuilder> {
  String? get id;
  String get center_id;
  String get created_at;
  String get created_by;
  double get amount;
  int get item_count;
  String? get customer_id;
  String get payment_method;

  Sales._();
  static Serializer<Sales> get serializer => _$salesSerializer;
  factory Sales([void Function(SalesBuilder) updates]) = _$Sales;

  static Sales parseJsonToSales(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(serializer, json)!;

  static Map<String, dynamic> parseSalesToJson(Sales sales) => {
        "id": sales.id,
        "center_id": sales.center_id,
        "created_at": sales.created_at,
        "created_by": sales.created_by,
        "amount": sales.amount,
        "item_count": sales.item_count,
        "customer_id": sales.customer_id,
        "payment_method": sales.payment_method,
      };

  static Map<String, dynamic> parseSalesToTransactionJson(Sales sales) => {
        "id": sales.id,
        "center_id": sales.center_id,
        "created_at": sales.created_at,
        "transaction_at": sales.created_at,
        "created_by": sales.created_by,
        "amount": sales.amount,
        "source": "sales",
        "type": "credit",
        "description": sales.id,
        "payment_method": sales.payment_method,
      };
}
