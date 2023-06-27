import 'package:flutter/material.dart';
import '../data/question.dart';
import '../calls/question_calls.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final List<Question> questions;
  const QuestionScreen(this.question, this.questions, {super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late TextEditingController controller;
  bool ans = false;
  @override
  void initState() {
    controller = TextEditingController();
    controller.text = switch (widget.question.questionText) {
      'Picture' => 'The sign in the picture is',
      'PictureV' => 'The sign in the picture means all vehicles are allowed only to',
      'PictureO' => 'The sign in the picture allows _______ only',
      _ => widget.question.questionText,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question Screen')),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            switch (widget.question.questionText) {
              'Picture' || 'PictureV' || 'PictureO' => widget.question.getPicture(150)!,
              _ => const SizedBox(height: 1, width: 1),
            },
            TextField(
              readOnly: true,
              controller: controller,
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            getButton('A', widget.question.a),
            const SizedBox(height: 20),
            getButton('B', widget.question.b),
            const SizedBox(height: 20),
            getButton('C', widget.question.c),
            const SizedBox(height: 20),
            getButton('D', widget.question.d),
            const SizedBox(height: 20),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: ans ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: Colors.black54),
              ),
              child: ans
                  ? const Center(
                      child: Text(
                      'Correct',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ))
                  : const SizedBox(height: 1, width: 1),
            ),
            SizedBox(height: 30),
            getNextButton(ans, 'Next'),
          ],
        ),
      ),
    );
  }

  Widget getButton(String value, String question) {
    return FilledButton.tonal(
      onPressed: () {
        setState(() {
          ans = widget.question.answer == value;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(
        question,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getNextButton(bool value, String question) {
    return SizedBox(
      height: 100,
      child: FilledButton.tonal(
        onPressed: value == false
            ? null
            : () {
                Navigator.pop(context);
                Question question = getRandomQuestion(widget.questions);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionScreen(question, widget.questions)));
              },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all<Color>(value ? Colors.green : Colors.blueGrey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: value ? 3 : 1),
          )),
        ),
        child: Text(
          question,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: value ? const TextStyle(color: Colors.black, fontSize: 20) : const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
