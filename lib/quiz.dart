// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Text(
                      "Question 1",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(
                    "/10",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Column(children: [
              Container(
                margin: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: const Text(
                  "Where are you from ______?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => print("First Container Clicked"),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: const Text(
                    "Palestine",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: const Text(
                    "Egypt",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: const Text(
                    "Saudi Arabia",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: const Text(
                    "None of these",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
