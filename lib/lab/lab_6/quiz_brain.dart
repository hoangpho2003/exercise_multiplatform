import 'dart:convert';
import 'package:flutter/services.dart';

class QuizBrain {
  List<Map<String, dynamic>> _questionBank = [];
  int _currentQuestionIndex = 0;

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/quizzler/questions.json');
    final List<dynamic> data = jsonDecode(response);
    _questionBank = List<Map<String, dynamic>>.from(data);
  }

  String getQuestionText() {
    return _questionBank[_currentQuestionIndex]["question"];
  }

  bool getCorrectAnswer() {
    return _questionBank[_currentQuestionIndex]["answer"];
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questionBank.length - 1) {
      _currentQuestionIndex++;
    }
  }

  bool isFinished() {
    return _currentQuestionIndex >= _questionBank.length - 1;
  }

  void reset() {
    _currentQuestionIndex = 0;
  }
}
