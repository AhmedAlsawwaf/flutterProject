// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart' as sql;

class SqliteService {
  Future<void> createTables(sql.Database database) async {
    await database.execute(
      """CREATE TABLE QuizQuestions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            answers TEXT NOT NULL,
            correctAnswerIndex INTEGER NOT NULL,
            createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
            """,
    );
  }

  Future<sql.Database> db() async {
    return sql.openDatabase(
      'quiz.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new question
  Future<int> createQuestion(QuizQuestion quizQuestion) async {
    final db = await SqliteService().db();
    final id = await db.insert('QuizQuestions', quizQuestion.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  // Get all questions
  Future<List<QuizQuestion>> getQuestions() async {
    final db = await SqliteService().db();
    final List<Map<String, Object?>> queryResult =
        await db.query('QuizQuestions', orderBy: 'id');
    return queryResult.map((e) => QuizQuestion.fromMap(e)).toList();
  }

  // Delete question by id
  Future<void> deleteQuestion(int id) async {
    final db = await SqliteService().db();
    try {
      await db.delete("QuizQuestions", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}

class QuizQuestion {
  int? id;
  String title;
  List<String> answers;
  int correctAnswerIndex;

  QuizQuestion({
    this.id,
    required this.title,
    required this.answers,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'answers': answers.join('|'),
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  static QuizQuestion fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      id: map['id'],
      title: map['title'],
      answers: (map['answers'] as String).split('|'),
      correctAnswerIndex: map['correctAnswerIndex'],
    );
  }
}
