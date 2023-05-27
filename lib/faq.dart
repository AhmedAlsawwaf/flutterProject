import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const Text(
                "Sorry!",
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "You must add 5 questions al least to start quiz!",
                style: TextStyle(),
              ),
            ),
            Image.asset('images/faq.png'),
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
