import 'package:flutter/material.dart';
import '../quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    await quizBrain.loadQuestions();
    setState(() {
      isLoading = false;
    });
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }

      if (quizBrain.isFinished()) {
        // Hiển thị thông báo khi kết thúc bài kiểm tra
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Hoàn thành!"),
            content: const Text("Bạn đã trả lời hết tất cả câu hỏi."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    quizBrain.reset();
                    scoreKeeper.clear();
                  });
                },
                child: const Text("Chơi lại"),
              ),
            ],
          ),
        );
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  "Đúng",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  "Sai",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
