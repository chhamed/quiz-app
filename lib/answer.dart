import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;

  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     // height: MediaQuery.of(context).size.height*0.07,
      child: MaterialButton(
        color: Colors.cyan,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: () {
          x();
        },
      ),
    );
  }
}
