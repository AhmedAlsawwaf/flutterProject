// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/sqlite_service.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

Future addQuestion(QuizQuestion question) async {
  await SqliteService().createQuestion(question);
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final options = [
    {'value': 0, 'label': 'A'},
    {'value': 1, 'label': 'B'},
    {'value': 2, 'label': 'C'},
    {'value': 3, 'label': 'D'},
  ];

  late String title;
  final List<String> answers = [
    "",
    "",
    "",
    ""
  ]; // replace with actual input value
  late String correct_ans = "0";
  late QuizQuestion question;

  void createQuizQuestion() {
    question = QuizQuestion(
      title: title,
      answers: answers,
      correctAnswerIndex: int.parse(correct_ans),
    );
  }

  void _handleSubmit() async {
    createQuizQuestion();
    await addQuestion(question);
    _formKey.currentState!.reset();
    scaffoldMessengerKey.currentState!.showSnackBar(
      const SnackBar(
        content: Text('Question added successfully'),
        behavior: SnackBarBehavior.floating, // Change behavior to floating
        backgroundColor: Colors.teal,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add new question'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
            child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(12, 24, 12, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle:
                          const TextStyle(color: Colors.grey, fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.question_mark),
                      labelText: 'Question',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return 'Please enter the question.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      title = value!;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            child: Text(
                              "A",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'First answer',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter the first answer.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                answers[0] = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: Text(
                              "B",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'Second answer',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter the second answer.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                answers[1] = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              "C",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'Third answer',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter the third answer.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                answers[2] = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            child: Text(
                              "C",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'Fourth answer',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.teal),
                                ),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter the fourth answer.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                answers[3] = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const Text(
                          "Select the correct answer",
                          style: TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        Expanded(
                          child: DropdownButton<String>(
                              value: correct_ans,
                              icon: const Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.teal),
                              underline: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  correct_ans = newValue!;
                                  print(correct_ans);
                                });
                              },
                              items: options
                                  .map<DropdownMenuItem<String>>((option) {
                                return DropdownMenuItem<String>(
                                  value: option['value'].toString(),
                                  child: Text(option['label'].toString()),
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 24)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ))),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // print('Name: $title');
                          // print('Answers: $answers');
                          // print('Correct answer: $correct_ans');
                          _handleSubmit();
                        }
                      },
                      child: const Text(
                        "Add question",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
