import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetState;

  Result(this.score, this.resetState);

  String get resultPhrase {
    String resultText;
    if (score < 10) {
      resultText = "Good";
    } else {
      resultText = "bad";
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
            child: Text("Restart Quiz!"),
            onPressed: resetState,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
