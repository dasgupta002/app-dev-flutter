import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:enum_to_string/enum_to_string.dart';

import '../models/questions.dart';
import '../models/error.dart';

import './base.dart';

import '../enum/difficulty.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final quizProvider = Provider<Quiz>((ref) => Quiz(ref.read));

class Quiz extends QuizRepo {
  final Reader _read;

  Quiz(this._read);

  @override
  Future<List<Questions>> fetchQuestions({ @required int numberOfQuestions, @required int categoryID, @required Difficulty difficulty }) async {
    try {
      final queryParams = { 'type': 'multiple', 'amount': numberOfQuestions, 'category': categoryID };
    
      if(difficulty != Difficulty.any) {
        queryParams.addAll({ 'difficulty': EnumToString.convertToString(difficulty) });
      }

      final response = await _read(dioProvider).get('https://opentdb.com/api.php', queryParameters: queryParams);

      if(response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String, dynamic>>.from(data['results'] ?? []);

        if(results.isNotEmpty) {
          return results.map((item) => Questions.fromMap(item)).toList();
        }
      }

      return []; 
    } on DioError catch (error) {
      print(error);
      throw Failure(message: error.response?.statusMessage);
    } on SocketException catch (error) {
      print(error);
      throw Failure(message: 'Please check your connection!');
    }
  }
}