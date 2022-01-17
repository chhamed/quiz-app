import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class Logic extends StatefulWidget {
  const Logic({Key? key}) : super(key: key);

  @override
  _LogicState createState() => _LogicState();
}

Color w = Colors.white;
Color b = Colors.black;

class _LogicState extends State<Logic> {
  int questionIndex = 0;

  int totaleScore = 0;
  int num0 = 0;
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  bool switched = false;

  void answerQuestion(int score) {
    if (questionIndex == 0)
      num0 = score;
    else if (questionIndex == 1)
      num1 = score;
    else if (questionIndex == 2)
      num2 = score;
    else if (questionIndex == 3) num3 = score;

    setState(() {
      totaleScore += score;
      questionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totaleScore = 0;
      num3 = 0;
      num2 = 0;
      num1 = 0;
      num0 = 0;
    });
  }

  final List<Map<String, dynamic>> question = [
    {
      "questionText": "what is you favourite colour ?",
      "answers": [
        {"text": "blue", "score": 1},
        {"text": "red", "score": 2},
        {"text": "green", "score": 3},
      ]
    },
    {
      "questionText": "what is you favourite animal ?",
      "answers": [
        {"text": "cat", "score": 1},
        {"text": "dog", "score": 2},
        {"text": "duck", "score": 3},
      ]
    },
    {
      "questionText": "what is you favourite movie ?",
      "answers": [
        {"text": "beautiful mind", "score": 1},
        {"text": "Dark knight", "score": 2},
        {"text": "harry potter", "score": 3}
      ]
    },
    {
      "questionText": "what is you favourite book ?",
      "answers": [
        {"text": "rich dad poor dad", "score": 1},
        {"text": "War and Peace", "score": 2},
        {"text": "One Hundred Years of Solitude", "score": 3},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: [
            Switch(
              value: (switched),
              onChanged: (value) {
                setState(() {
                  switched = value;
                  if (switched == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (switched == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.white,
              activeColor: Colors.white,
            )
          ],
          title: Text("Quiz App"),
        ),
        body: Container(
            color: w,
            child: questionIndex < question.length
                ? Quiz(question, questionIndex, answerQuestion)
                : Result(resetQuiz, totaleScore)),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.arrow_back,
            color: b,
          ),
          onPressed: () {
            if (questionIndex == 1)
              totaleScore -= num0;
            else if (questionIndex == 2)
              totaleScore -= num1;
            else if (questionIndex == 3)
              totaleScore -= num2;
            else if (questionIndex == 4) totaleScore -= num3;
            setState(() {
              if (questionIndex > 0) questionIndex--;
            });
          },
        ),
      ),
    );
  }
}
