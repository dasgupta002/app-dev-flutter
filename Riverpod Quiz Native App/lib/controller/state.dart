import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/questions.dart';

import '../enum/status.dart';

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Questions> correctAnswers;
  final List<Questions> incorrectAnswers;
  final Status status;

  bool get answered => status == Status.incorrect || status == Status.correct;

  QuizState({ @required this.selectedAnswer, @required this.correctAnswers, @required this.incorrectAnswers, @required this.status });

  factory QuizState.initial() {
    return QuizState(selectedAnswer: '', correctAnswers: [], incorrectAnswers: [], status: Status.initial);
  }

  @override
  List<Object> get props => [selectedAnswer, correctAnswers, incorrectAnswers, status];

  QuizState copyWith({ String selectedAnswer, List<Questions> correctAnswers, List<Questions> incorrectAnswers, Status status }) {
    return QuizState(
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      status: status ?? this.status
    );
  }
}