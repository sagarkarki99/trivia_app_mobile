import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/question_form/cubit/question_form_cubit.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/custom_text_field.dart';

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
    final cubit = context.watch<QuestionFormCubit>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Form(
        key: cubit.formKey,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Text(
                'Question',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      letterSpacing: 1.2,
                      color: AppColors.light.dark.withOpacity(0.6),
                    ),
              ),
            ),
            CustomTextField(
              controller: cubit.questionController,
              fillColor: AppColors.light.lightBrown,
              labelText: 'Ask Question',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Question field cannot be empty.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text('Answer Options'),
            ),
            CustomTextField(
              controller: cubit.answer1Controller,
              validator: validateOptions,
              isSelected: cubit.state.selected.isNotEmpty &&
                  cubit.answer1Controller.text == cubit.state.selected,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cubit.answer2Controller,
              isSelected: cubit.state.selected.isNotEmpty &&
                  cubit.answer2Controller.text == cubit.state.selected,
              validator: validateOptions,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cubit.answer3Controller,
              isSelected: cubit.state.selected.isNotEmpty &&
                  cubit.answer3Controller.text == cubit.state.selected,
              validator: validateOptions,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cubit.answer4Controller,
              isSelected: cubit.state.selected.isNotEmpty &&
                  cubit.answer4Controller.text == cubit.state.selected,
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
