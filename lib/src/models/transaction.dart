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

  Transaction._();

  static Serializer<Transaction> get serializer => _$transactionSerializer;

  factory Transaction([void Function(TransactionBuilder) updates]) =
      _$Transaction;

  static Transaction parseJsonToTransaction(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(Transaction.serializer, json)!;
}
