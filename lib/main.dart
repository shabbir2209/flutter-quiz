// The main functions which runs initially
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

// widget class
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// The state widget here is not changed or rebuilt:
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 6},
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Frog', 'score': 3},
        {'text': 'Dinosaur', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favorite movie',
      'answers': [
        {'text': 'Fast and the Furious', 'score': 6},
        {'text': 'Lion King', 'score': 1},
        {'text': 'Transformers', 'score': 3},
        {'text': 'Transporter', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  // This states that the standard widget build is being over riden with our own widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzer'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
