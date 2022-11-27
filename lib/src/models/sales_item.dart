import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'sales_item.g.dart';

abstract class SalesItem implements Built<SalesItem, SalesItemBuilder> {
  String? get id;
  String get center_id;
  String get created_at;
  String get item_name;
  String get item_id;
  String get item_photo_uri;
  int get quantity;
  double get unit_price;
  double get total;
  String get sales_id;

  SalesItem._();
  static Serializer<SalesItem> get serializer => _$salesItemSerializer;
  factory SalesItem([void Function(SalesItemBuilder) updates]) = _$SalesItem;

  static SalesItem parseJsonToExpense(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(serializer, json)!;

  static Map<String, dynamic> parseExpenseToJson(SalesItem salesItem) => {
        "id": salesItem.id,
        "center_id": salesItem.center_id,
        "created_at": salesItem.created_at,
        "item_name": salesItem.item_name,
        "item_id": salesItem.item_id,
        "item_photo_uri": salesItem.item_photo_uri,
        "quantity": salesItem.quantity,
        "unit_price": salesItem.unit_price,
        "total": salesItem.total,
        "sales_id": salesItem.sales_id,
      };
}
