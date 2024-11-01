// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'question.dart';

class QuestionMapper extends ClassMapperBase<Question> {
  QuestionMapper._();

  static QuestionMapper? _instance;
  static QuestionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuestionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Question';

  static String? _$question(Question v) => v.question;
  static const Field<Question, String> _f$question =
      Field('question', _$question);
  static List<String>? _$answers(Question v) => v.answers;
  static const Field<Question, List<String>> _f$answers =
      Field('answers', _$answers);
  static String? _$correctAnswer(Question v) => v.correctAnswer;
  static const Field<Question, String> _f$correctAnswer =
      Field('correctAnswer', _$correctAnswer);

  @override
  final MappableFields<Question> fields = const {
    #question: _f$question,
    #answers: _f$answers,
    #correctAnswer: _f$correctAnswer,
  };

  static Question _instantiate(DecodingData data) {
    return Question(data.dec(_f$question), data.dec(_f$answers),
        data.dec(_f$correctAnswer));
  }

  @override
  final Function instantiate = _instantiate;

  static Question fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Question>(map);
  }

  static Question fromJson(String json) {
    return ensureInitialized().decodeJson<Question>(json);
  }
}

mixin QuestionMappable {
  String toJson() {
    return QuestionMapper.ensureInitialized()
        .encodeJson<Question>(this as Question);
  }

  Map<String, dynamic> toMap() {
    return QuestionMapper.ensureInitialized()
        .encodeMap<Question>(this as Question);
  }

  QuestionCopyWith<Question, Question, Question> get copyWith =>
      _QuestionCopyWithImpl(this as Question, $identity, $identity);
  @override
  String toString() {
    return QuestionMapper.ensureInitialized().stringifyValue(this as Question);
  }

  @override
  bool operator ==(Object other) {
    return QuestionMapper.ensureInitialized()
        .equalsValue(this as Question, other);
  }

  @override
  int get hashCode {
    return QuestionMapper.ensureInitialized().hashValue(this as Question);
  }
}

extension QuestionValueCopy<$R, $Out> on ObjectCopyWith<$R, Question, $Out> {
  QuestionCopyWith<$R, Question, $Out> get $asQuestion =>
      $base.as((v, t, t2) => _QuestionCopyWithImpl(v, t, t2));
}

abstract class QuestionCopyWith<$R, $In extends Question, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get answers;
  $R call({String? question, List<String>? answers, String? correctAnswer});
  QuestionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuestionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Question, $Out>
    implements QuestionCopyWith<$R, Question, $Out> {
  _QuestionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Question> $mapper =
      QuestionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get answers =>
      $value.answers != null
          ? ListCopyWith(
              $value.answers!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(answers: v))
          : null;
  @override
  $R call(
          {Object? question = $none,
          Object? answers = $none,
          Object? correctAnswer = $none}) =>
      $apply(FieldCopyWithData({
        if (question != $none) #question: question,
        if (answers != $none) #answers: answers,
        if (correctAnswer != $none) #correctAnswer: correctAnswer
      }));
  @override
  Question $make(CopyWithData data) => Question(
      data.get(#question, or: $value.question),
      data.get(#answers, or: $value.answers),
      data.get(#correctAnswer, or: $value.correctAnswer));

  @override
  QuestionCopyWith<$R2, Question, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuestionCopyWithImpl($value, $cast, t);
}
