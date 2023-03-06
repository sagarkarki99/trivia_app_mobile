import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/question_payload.dart';

part 'question_form_state.dart';
part 'question_form_cubit.freezed.dart';

class QuestionFormCubit extends Cubit<QuestionFormState> {
  late TextEditingController questionController;
  late TextEditingController answer1Controller;
  late TextEditingController answer2Controller;
  late TextEditingController answer3Controller;
  late TextEditingController answer4Controller;
  late GlobalKey<FormState> _formKey;
  QuestionFormCubit() : super(const QuestionFormState()) {
    questionController = TextEditingController(text: "What is your name?");
    answer1Controller = TextEditingController(text: "Nino");
    answer2Controller = TextEditingController(text: "Sagar");
    answer3Controller = TextEditingController(text: "Saugor");
    answer4Controller = TextEditingController(text: "Sanigor");
    _formKey = GlobalKey<FormState>();
  }

  GlobalKey<FormState> get formKey => _formKey;

  QuestionPayload? getQuestionPayload() {
    if (formKey.currentState!.validate()) {
      final payload = QuestionPayload(
        question: questionController.text.trim(),
        answerOptions: [
          answer1Controller.text.trim(),
          answer2Controller.text.trim(),
          answer3Controller.text.trim(),
          answer4Controller.text.trim(),
        ],
        correctAnswer: state.selected,
        totalSeconds: 20,
      );
      return payload;
    }
    return null;
  }

  setNewSelected(String value) {
    emit(state.copyWith(selected: value));
  }
}
