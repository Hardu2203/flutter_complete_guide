import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _total = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _total = 0;
    });
  }

  final _questions = const [
    {
      "questionText": "What's you favorite color?",
      "answers": [{"text" : "Black", "score" : 10 }, {"text" : "Red", "score" : 5 }, {"text" : "Green", "score" : 3 }, {"text" : "White", "score" : 1 }],
    },
    {
      "questionText": "What's you favorite animal?",
      "answers": [{"text" : "Rabbit", "score" : 1 }, {"text" : "Snake", "score" : 10 }, {"text" : "Black", "score" : 3 }, {"text" : "Black", "score" : 5 }],
    },
    {
      "questionText": "Who's your fave instructor",
      "answers": [{"text" : "Max", "score" : 1 }, {"text" : "Maxi", "score" : 1 }, {"text" : "Maxas", "score" : 1 }, {"text" : "MaxiPad", "score" : 1 }],
    },
  ];

  void _answerQuestion(int score) {

    _total+= score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_total, _resetQuiz),
      ),
    );
  }
}
