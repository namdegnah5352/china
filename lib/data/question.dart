import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

List<Question> questionModelFromJson(String str) =>
    List<Question>.from(json.decode(str)["question"].map((x) => Question.fromJson(x)));
String questionModelToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    required this.questionText,
    required this.id,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
  });
  late final String questionText;
  late final String id;
  late final String a;
  late final String b;
  late final String c;
  late final String d;
  late final String answer;
  Image? picture;

  Question.fromJson(Map<String, dynamic> json) {
    questionText = json['Q'];
    id = json['Id'];
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Q'] = questionText;
    data['Id'] = id;
    data['A'] = a;
    data['B'] = b;
    data['C'] = c;
    data['D'] = d;
    data['Answer'] = answer;
    return data;
  }

  Image? getPicture(double size) {
    var file = 'assets/images/$id.png';
    return switch (questionText) {
      'Picture' => getImage(file, size),
      'PictureV' => getImage(file, size),
      'PictureO' => getImage(file, size),
      _ => null
    };
  }

  Image getImage(String file, double size) {
    return Image.asset(
      file,
      fit: BoxFit.fitHeight,
      height: size,
    );
  }
}
