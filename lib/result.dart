import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function q;
  final int score;

  String get resultPhrase {
    String ResultText = "";
    if (score >= 7)
      ResultText = "Good job";
    else if (score >= 4)
      ResultText = "You can do better next time";
    else
      ResultText = "Maybe next time";
    return ResultText;
  }

  Result(this.q, this.score);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "your score is  $score \n$resultPhrase",
            style: TextStyle(
                fontSize: 30,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
        ),
        MaterialButton(
            onPressed: () {
              q();
            },
            child: Text(
              "Restart Quiz",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ))
      ],
    ));
  }
}
