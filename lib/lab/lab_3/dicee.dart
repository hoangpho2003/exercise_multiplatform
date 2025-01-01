import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiplatform_vku/lab/lab_3/widget/roll_dice_left.dart';
import 'package:multiplatform_vku/lab/lab_3/widget/roll_dice_right.dart';
import '../lab_4/ball_page.dart';
import 'controller/dicee_controller.dart';

class DicePage extends StatelessWidget {
  DicePage({super.key});

  final DiceController diceController = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roller'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RollDiceLeft(diceController: diceController),
                const SizedBox(width: 10),
                RollDiceRight(diceController: diceController),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () => Get.to(() => BallPage()),
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
              ),
              child: const Text(
                'Lab 4',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

