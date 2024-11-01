import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.mapper.dart';

@MappableClass()
@JsonSerializable()
class Question with QuestionMappable {
  String? question;
  List<String>? answers;
  String? correctAnswer;
  Question(this.question, this.answers, this.correctAnswer);
}
