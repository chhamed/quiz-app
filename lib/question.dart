import 'package:flutter/material.dart';
import 'logic.dart';
class Question extends StatelessWidget {
  final String? questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Text(
          questionText!,
          style: TextStyle(fontSize: 20,color: b,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
