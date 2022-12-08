import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'expense.g.dart';

abstract class Expense implements Built<Expense, ExpenseBuilder> {
  String? get id;
  String get ticket_id;
  String get item_name;
  double get cost;
  double get unit_price;
  String get created_by;
  String get created_at;
  int get quantity;
  String get item_id;

  Expense._();
  static Serializer<Expense> get serializer => _$expenseSerializer;
  factory Expense([void Function(ExpenseBuilder) updates]) = _$Expense;

  static Expense parseJsonToExpense(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(serializer, json)!;

  static Map<String, dynamic> parseExpenseToJson(Expense expense) => {
        "id": expense.id,
        "ticket_id": expense.ticket_id,
        "item_name": expense.item_name,
        "cost": expense.cost,
        "created_by": expense.created_by,
        "created_at": expense.created_at,
        "unit_price": expense.unit_price,
        "item_id": expense.item_id,
        "quantity": expense.quantity,
      };
}
