import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'issue.g.dart';

abstract class Issue implements Built<Issue, IssueBuilder> {
  String? get id;
  String get created_at;
  String? get ticket_id;
  int get is_closed;
  String get description;

  static Serializer<Issue> get serializer => _$issueSerializer;

  Issue._();
  factory Issue([void Function(IssueBuilder) updates]) = _$Issue;

  static Issue? parseToIssue(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(
        Issue.serializer,
        json,
      );

  static Map<String, dynamic> parseToJson(Issue? issue) => {
        "id": issue!.id,
        "created_at": issue.created_at,
        "ticket_id": issue.ticket_id,
        "is_closed": issue.is_closed,
        "description": issue.description,
      };
}
