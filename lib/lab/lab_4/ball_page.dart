import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiplatform_vku/lab/lab_5/xylophone.dart';

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('GeeksforGeeks'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Ball(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => Get.to(() => const XylophoneApp()),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            ),
            child: const Text(
              'Lab 5',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// Creates a Stateful widget
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            // Random.nextInt(n) returns a random integer from 0 to n-1
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        // Adding images
        child: Image.asset(
          'assets/images/balls/ball$ballNumber.png',
        ),
      ),
    );
  }
}
