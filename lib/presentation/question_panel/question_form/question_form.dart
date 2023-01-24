import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/question_panel/question_form/cubit/question_form_cubit.dart';

class QuestionForm extends StatelessWidget {
  const QuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionFormCubit(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<QuestionFormCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: cubit.questionController,
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: cubit.answer1Controller,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer2Controller,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer3Controller,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: cubit.answer4Controller,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: cubit.state is Ready ? () {} : null,
            child: const Text('Ask'),
          )
        ],
      ),
    );
  }
}
