import '../models/questions.dart';

import '../enum/difficulty.dart';

abstract class QuizRepo {
  Future<List<Questions>> fetchQuestions({ int numberOfQuestions, int categoryID, Difficulty difficulty });
}