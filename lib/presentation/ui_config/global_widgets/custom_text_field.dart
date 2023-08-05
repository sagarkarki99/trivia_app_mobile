import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/question_form/cubit/question_form_cubit.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final bool enabled;
  final TextEditingController controller;
  final Function(String? value)? onChanged;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool? isSelected;
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.onChanged,
    this.fillColor,
    this.enabled = true,
    this.validator,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: fillColor ?? _getLocalColor(),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: enabled,
                controller: controller,
                validator: validator,
                cursorColor: AppColors.light.primary,
                decoration: InputDecoration(
                  hintText: labelText,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                onChanged: onChanged,
                textInputAction: TextInputAction.next,
              ),
            ),
            isSelected == null ? const SizedBox() : _buildTrailing(context),
          ],
        ),
      ),
    );
  }

  Row _buildTrailing(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () =>
              context.read<QuestionFormCubit>().setNewSelected(controller.text),
          child: Icon(
            isSelected! ? Icons.circle_rounded : Icons.circle_outlined,
            size: 18.0,
            color: AppColors.light.primary.withOpacity(0.4),
          ),
        ),
        const SizedBox(width: 8.0)
      ],
    );
  }

  _getLocalColor() {
    return (isSelected != null && isSelected!)
        ? AppColors.light.lightGreen
        : AppColors.light.primary.withOpacity(0.1);
  }
}

class _RegExpInputFormatter extends TextInputFormatter {
  final RegExp regExp;

  _RegExpInputFormatter(this.regExp);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty ||
        !newValue.composing.isCollapsed ||
        !newValue.selection.isCollapsed) {
      return newValue;
    }
    final matches = regExp.allMatches(newValue.text);
    if (matches.length == 1 &&
        matches.first.group(0).toString() == newValue.text) {
      return newValue;
    }
    return oldValue;
  }
}
