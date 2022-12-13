import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'page.g.dart';

abstract class Page<T> implements Built<Page<T>, PageBuilder<T>> {
  int get current_page;
  int get last_page;
  List<T> get data;

  Page._();
  static Serializer<Page> get serializer => _$pageSerializer;
  factory Page([void Function(PageBuilder<T>) updates]) = _$Page<T>;

  static Page<T> parseJsonToPage<T>(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(Page.serializer, json)!;
}
