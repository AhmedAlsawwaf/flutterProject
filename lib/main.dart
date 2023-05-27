// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/addQuestion.dart';
import 'package:flutter_application_1/quizes.dart';
import 'package:flutter_application_1/quizesData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Quiz app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width *
            0.80, // 80% of screen will be occupied
        elevation: 25,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Ahmad",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              accountEmail: Text(
                "Ahmad@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 172, 64, 255),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Create quiz"),
                onTap: () => {
                      Navigator.pop(context), // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddQuestion()),
                      ),
                    }),
            ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text("Start quiz"),
                onTap: () => {
                      Navigator.pop(context), // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quizes()),
                      ),
                    }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Exit"),
              onTap: () {
                // Close the application when tapped
                exit(0);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/quiz.png'),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 24)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Quizes()),
                ),
                child: const Text(
                  "Let's start!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
