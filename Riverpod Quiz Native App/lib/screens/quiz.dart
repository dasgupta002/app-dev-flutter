import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:html_character_entities/html_character_entities.dart';

import '../models/questions.dart';
import '../models/error.dart';

import '../repository/quiz.dart';

import '../controller/state.dart';
import '../controller/handler.dart';

import '../enum/difficulty.dart';
import '../enum/status.dart';

import '../components/button.dart';
import '../components/tile.dart';
import '../components/error.dart';

final questionsProvider = FutureProvider.autoDispose<List<Questions>>((ref) => ref.watch(quizProvider).fetchQuestions(numberOfQuestions: 5, categoryID: Random().nextInt(24) + 9, difficulty: Difficulty.any));

class Quiz extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final questions = useProvider(questionsProvider);
    final pageController = usePageController();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFFD4418E), Color(0xFF0652C5) ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: questions.when(
          data: (data) => _buildView(context, pageController, data),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => ErrorView(message: error is Failure ? error.message : 'Something went wrong!', handler: () => context.refresh(questionsProvider))
        ),
        bottomSheet: questions.maybeWhen(
          data: (data) {
            final state = useProvider(controllerProvider.state);
            if(!state.answered) return SizedBox.shrink();

            return Button(
              title: pageController.page.toInt() + 1 < data.length ? 'Next' : 'See Results',
              handler: () {
                context.read(controllerProvider).next(data, pageController.page.toInt());

                if(pageController.page.toInt() + 1 < data.length) {
                  pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.linear);
                }
              }
            );
          },
          orElse: () => SizedBox.shrink()
        )
      )
    );
  }
}

Widget _buildView(BuildContext context, PageController controller, List<Questions> questions) {
  if(questions.isEmpty) return ErrorView(message: 'No questions found!', handler: () {});

  final state = useProvider(controllerProvider.state);
  return state.status == Status.complete ? Results(state: state, questions: questions) : Question(pageController: controller, state: state, questions: questions);
}

class Results extends StatelessWidget {
  final QuizState state;
  final List<Questions> questions;
  
  Results({ @required this.state, @required this.questions });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          '${state.correctAnswers.length} / ${questions.length}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600
          )
        ),
        Text(
          'CORRECT',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold
          )
        ),
        SizedBox(height: 40.0),
        Button(
          title: 'New Quiz',
          handler: () {
            context.refresh(quizProvider);
            context.read(controllerProvider).reset();
          }
        )
      ]      
    );
  }
}

class Question extends StatelessWidget {
  final PageController pageController;
  final QuizState state;
  final List<Questions> questions;
  
  Question({ @required this.pageController, @required this.state, @required this.questions });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Question ${index + 1} of ${questions.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                HtmlCharacterEntities.decode(question.question),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500
                )
              )
            ),
            Divider(
              color: Colors.grey[200],
              height: 32.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0
            ),
            Column(
              children: question.answers.map((answer) => Tile(answer: answer, selected: answer == state.selectedAnswer, correct: answer == question.correctAnswer, display: state.answered, handler: () => context.read(controllerProvider).submit(question, answer))).toList()
            )
          ]
        );
      }     
    );
  }
}