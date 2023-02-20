part of 'question_form_cubit.dart';

@freezed
class QuestionFormState with _$QuestionFormState {
  const factory QuestionFormState({
    @Default(FormStatus.initial()) FormStatus status,
    @Default('') String selected,
  }) = _QuestionFormState;
}

@freezed
class FormStatus with _$FormStatus {
  const factory FormStatus.initial() = Initial;
  const factory FormStatus.ready() = Ready;
}
