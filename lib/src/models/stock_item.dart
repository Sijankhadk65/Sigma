import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'stock_item.g.dart';

abstract class StockItem implements Built<StockItem, StockItemBuilder> {
  String? get id;
  String get center_id;
  String get created_at;
  String get created_by;
  double get unit_price;
  int get quantity;
  String get item_name;
  String get item_photo_uri;

  StockItem._();
  static Serializer<StockItem> get serializer => _$stockItemSerializer;

  factory StockItem([void Function(StockItemBuilder) updates]) = _$StockItem;

  static StockItem parseJsonToStockItem(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(serializer, json)!;

  static Map<String, dynamic> parseStockItemToJson(StockItem stockItem) => {
        "id": stockItem.id,
        "center_id": stockItem.center_id,
        "created_at": stockItem.created_at,
        "created_by": stockItem.created_by,
        "unit_price": stockItem.unit_price,
        "quantity": stockItem.quantity,
        "item_name": stockItem.item_name,
        "item_photo_uri": stockItem.item_photo_uri,
      };
}
