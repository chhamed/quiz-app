import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.question, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
      Question(question[questionIndex]["questionText"]),
    ]..addAll(
            (question[questionIndex]["answers"] as List<Map<String, dynamic>>)
                .map((answer) {
              return Answer(
                  () => answerQuestion(answer["score"]), answer["text"]);
            }).toList(),
          ));
  }
}
