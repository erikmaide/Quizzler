import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questionVault = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: false),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  int questionNumber = 0;

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = questionVault[questionNumber].questionAnswer;
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionVault[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
