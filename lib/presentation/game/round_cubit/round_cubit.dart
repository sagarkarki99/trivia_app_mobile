import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/models/answer.dart';
import 'package:trivia_app/models/question_payload.dart';

part 'round_state.dart';
part 'round_cubit.freezed.dart';

class RoundCubit extends Cubit<RoundState> {
  final SocketClient client;
  final String gameId;
  Timer? _timer;
  RoundCubit({
    required this.client,
    required this.gameId,
    required QuestionPayload questionPayload,
  }) : super(
          RoundState(
            questionPayload: questionPayload,
            remainingMilliseconds: questionPayload.totalSeconds * 1000,
          ),
        ) {
    client.recieveOn(RecievingEvent.newAnswerSubmitted, (payload) {
      emit(
        state.copyWith(
          status: const RoundStatus.newAnswered(),
          answers: List.of(state.answers)
            ..add(
              Answer.fromJson(payload as Map<String, dynamic>),
            ),
        ),
      );
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (state.remainingMilliseconds > 0) {
        emit(state.copyWith(
            remainingMilliseconds: state.remainingMilliseconds - 100));
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    super.close();
  }

  void answerQuestion(String answer) {
    client.send(SendingEvent.answerQuestion, {
      "gameId": gameId,
      "answer": {
        "userAnswer": answer,
        "remainingSeconds": 3,
      }
    });
  }
}
