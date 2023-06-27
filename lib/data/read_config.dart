import 'package:flutter/material.dart';
import '../data/question.dart';
import 'package:flutter/services.dart';
import '../screens/question_search.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Future<List<Question>> loadJsonData(BuildContext context) async {
    var jsonText = await rootBundle.loadString('assets/json/traffic_signs.json');
    List<Question> data = questionModelFromJson(jsonText);
    // now get the pictures, if they have one
    for (var question in data) {
      question.picture = question.getPicture(50);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Question>>(
        future: loadJsonData(context),
        builder: (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          if (snapshot.hasData) {
            return QuestionSearch(snapshot.data!);
          } else {
            return loadingScreen(context);
          }
        });
  }
}

Widget loadingScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(50),
      child: const Text('loading'),
    ),
  );
}
