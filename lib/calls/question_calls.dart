import '../data/question.dart';
import 'dart:math';

Question getRandomQuestion(List<Question> questions) {
  int i = questions.length;
  var random = Random();
  int r = random.nextInt(i);
  return questions[r];
}
