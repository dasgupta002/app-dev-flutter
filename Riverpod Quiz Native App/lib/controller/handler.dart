import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/questions.dart';

import './state.dart';

import '../enum/status.dart';

final controllerProvider = StateNotifierProvider.autoDispose<Controller>((ref) => Controller());

class Controller extends StateNotifier<QuizState> {
  Controller() : super(QuizState.initial());

  void submit(Questions question, String answer) {
    if (state.answered) return;

    if (question.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correctAnswers: state.correctAnswers..add(question),
        status: Status.correct
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        incorrectAnswers: state.incorrectAnswers..add(question),
        status: Status.incorrect
      );
    }
  }

  void next(List<Questions> questions, int index) {
    state = state.copyWith(
      selectedAnswer: '',
      status: index + 1 < questions.length ? Status.initial : Status.complete
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}