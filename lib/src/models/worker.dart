import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'worker.g.dart';

abstract class Worker implements Built<Worker, WorkerBuilder> {
  String? get id;
  String get name;
  String get address;
  int get ph_number;
  int get total_income;
  int get total_services;

  static Serializer<Worker> get serializer => _$workerSerializer;
  Worker._();
  factory Worker([void Function(WorkerBuilder) updates]) = _$Worker;

  static Worker parseJsonToWorker(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(Worker.serializer, json)!;

  static String parseWorkerToJson(Worker worker) =>
      jsonSerializer.toJson(Worker.serializer, worker);
}
