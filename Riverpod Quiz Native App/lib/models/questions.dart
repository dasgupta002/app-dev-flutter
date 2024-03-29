import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Questions extends Equatable {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> answers;

  Questions({ @required this.category, @required this.difficulty, @required this.question, @required this.correctAnswer, @required this.answers });

  @override
  List<Object> get props => [ category, difficulty, question, correctAnswer, answers ];

  factory Questions.fromMap(Map<String, dynamic> map) {
    return Questions(
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correct_answer'] ?? '',
      answers: List<String>.from(map['incorrect_answers'] ?? '') 
        ..add(map['correct_answer'] ?? '')
        ..shuffle()
    );
  }
}