import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(MyApp());
}

class _QuizAppState extends State<QuizApp> {
  Icon addIcon(Color color) {
    if (color == Colors.green) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  void quizCheck(bool userPickedAnswer) {
    bool correctAns = quizbrain.getCorrectAnswer();
    if (userPickedAnswer == correctAns) {
      setState(() {
        quizbrain.nextQuestion();
        scoreKeeper.add(addIcon(Colors.green));
      });
    } else {
      setState(() {
        quizbrain.nextQuestion();
        scoreKeeper.add(addIcon(Colors.red));
      });
    }
  }

  QuizBrain quizbrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  quizCheck(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  quizCheck(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: SafeArea(
              child: Row(children: scoreKeeper),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: QuizApp(),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}
