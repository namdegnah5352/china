import '../data/question.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import '../screens/question_search_screen.dart';

Question getRandomQuestion(List<Question> questions) {
  int i = questions.length;
  var random = Random();
  int r = random.nextInt(i);
  return questions[r];
}

Future<void> loadSearchPage(BuildContext context, List<Question> data) async {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (_) => QuestionSearchScreen(data: data),
  ));
}
