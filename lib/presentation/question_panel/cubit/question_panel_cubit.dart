import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_panel_state.dart';
part 'question_panel_cubit.freezed.dart';

class QuestionPanelCubit extends Cubit<QuestionPanelState> {
  QuestionPanelCubit() : super(const QuestionPanelState.initial());
}
