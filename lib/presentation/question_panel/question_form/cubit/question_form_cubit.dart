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
  QuestionFormCubit() : super(const QuestionFormState.initial()) {
    questionController = TextEditingController(text: "What is your name?");
    answer1Controller = TextEditingController(text: "Nino");
    answer2Controller = TextEditingController(text: "Sagur");
    answer3Controller = TextEditingController(text: "Sagar");
    answer4Controller = TextEditingController(text: "Sagor");
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
        correctAnswer: answer1Controller.text.trim(),
        totalSeconds: 20,
      );
      return payload;
    }
    return null;
  }
}
