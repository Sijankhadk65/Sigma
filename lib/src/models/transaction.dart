import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'transaction.g.dart';

abstract class Transaction implements Built<Transaction, TransactionBuilder> {
  String? get id;
  String get created_at;
  String get created_by;
  String get transaction_at;
  String get type;
  String get source;
  String get description;
  double get amount;
  String get center_id;
  String get payment_method;

  Transaction._();

  static Serializer<Transaction> get serializer => _$transactionSerializer;

  factory Transaction([void Function(TransactionBuilder) updates]) =
      _$Transaction;

  static Transaction parseJsonToTransaction(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(Transaction.serializer, json)!;

  static Map<String, dynamic> parseTransactionToJson(Transaction transaction) =>
      {
        "created_at": transaction.created_at,
        "created_by": transaction.created_by,
        "transaction_at": transaction.transaction_at,
        "type": transaction.type,
        "source": transaction.source,
        "description": transaction.description,
        "center_id": transaction.center_id,
        "amount": transaction.amount,
        "payment_method": transaction.payment_method,
      };
}
