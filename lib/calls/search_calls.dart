import '../data/question.dart';

late List<Question> _fulldata;
late List<Question> _results;
List<Question> get results => _results;
List<Question> get fulldata => _fulldata;
set fulldata(List<Question> data) => _results = _fulldata = data;
void initialise() {}

void userInput(String criteria) {
  if (criteria.isEmpty) {
    _results = _fulldata;
  } else {
    _results = _fulldata.where((data) => _getSearchResult(data, criteria)).toList();
  }
}

bool _getSearchResult(Question question, String criteria) {
  bool result = false;
  var answers = switch (question.answer) {
    'A' => question.a,
    'B' => question.b,
    'C' => question.c,
    'D' => question.d,
    _ => '',
  };
  result = question.questionText.toLowerCase().startsWith(criteria.toLowerCase()) ||
      question.questionText.toLowerCase().contains(criteria.toLowerCase()) ||
      answers.toLowerCase().contains(criteria.toLowerCase());
  return result;
}

int noItemsToShow() {
  return _results.length;
}
