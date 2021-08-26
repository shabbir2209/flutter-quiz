import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are Innocent';
    } else if (resultScore <= 12) {
      resultText = 'You are Pretty Likable';
    } else if (resultScore <= 16) {
      resultText = 'You are Naughtylously strange';
    } else {
      resultText = 'DEMON!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz'),
            textColor: Colors.amber,
          )
        ],
      ),
    );
  }
}
