import 'package:flutter/material.dart';
import 'package:multiplatform_vku/lab/lab_6/widgets/quiz_page.dart';

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizzler App'),
          backgroundColor: Colors.blueGrey[900],
          leading: TextButton(
            onPressed: () {
              // Quay lại Lab 5
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: const QuizPage(),
      ),
    );
  }
}
