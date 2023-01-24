import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    questionController = TextEditingController();
    answer1Controller = TextEditingController();
    answer2Controller = TextEditingController();
    answer3Controller = TextEditingController();
    answer4Controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  get formKey => _formKey;
}
