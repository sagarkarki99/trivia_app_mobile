import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/question_panel/question_form/cubit/question_form_cubit.dart';

import '../../../models/question_payload.dart';

class QuestionForm extends StatelessWidget {
  final Function(QuestionPayload) onAsk;
  const QuestionForm({super.key, required this.onAsk});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionFormCubit(),
      child: _Body(onAsk: onAsk),
    );
  }
}

class _Body extends StatelessWidget {
  final void Function(QuestionPayload) onAsk;
  const _Body({required this.onAsk});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionFormCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: cubit.questionController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Question field cannot be empty.';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: cubit.answer1Controller,
            validator: validateOptions,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer2Controller,
            validator: validateOptions,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer3Controller,
            validator: validateOptions,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer4Controller,
            validator: validateOptions,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              final payload =
                  context.read<QuestionFormCubit>().getQuestionPayload();
              if (payload != null) {
                onAsk(payload);
              }
            },
            child: const Text('Ask'),
          )
        ],
      ),
    );
  }

  String? validateOptions(String? value) {
    if (value!.isEmpty) {
      return 'Option field cannot be empty';
    }
    return null;
  }
}
