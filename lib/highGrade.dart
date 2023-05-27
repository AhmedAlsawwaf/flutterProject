// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HighGrade extends StatelessWidget {
  const HighGrade(
      {super.key, required this.numberOfQuestions, required this.score});
  final int numberOfQuestions;
  final int score;

  @override
  Widget build(BuildContext context) {
    bool isExcellent = (score >= (numberOfQuestions * 0.75));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz app'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const Text(
                "Congratulations!",
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Image.asset('images/result.jpeg'),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Your scroe is $score / $numberOfQuestions",
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(isExcellent
                  ? "Your are a superstar"
                  : "Keep up the good wrok!"),
            ),
            SizedBox(
              width: 200,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 24)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  ),
                  child: const Text(
                    "Back to home",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
