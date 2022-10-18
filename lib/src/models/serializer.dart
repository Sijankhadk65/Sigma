library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/models/worker.dart';

part 'serializer.g.dart';

@SerializersFor(
  [
    Ticket,
    Issue,
    Customer,
    Worker,
    Transaction,
  ],
)
final Serializers serializers = _$serializers;
final jsonSerializer = (serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();
