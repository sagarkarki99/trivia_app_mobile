// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionPayload _$$_QuestionPayloadFromJson(Map<String, dynamic> json) =>
    _$_QuestionPayload(
      question: json['question'] as String,
      answerOptions: (json['answerOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswer: json['correctAnswer'] as String,
      totalSeconds: json['totalSeconds'] as int,
    );

Map<String, dynamic> _$$_QuestionPayloadToJson(_$_QuestionPayload instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answerOptions': instance.answerOptions,
      'correctAnswer': instance.correctAnswer,
      'totalSeconds': instance.totalSeconds,
    };
