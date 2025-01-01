import 'package:get/get.dart';
import 'dart:math';

class DiceController extends GetxController {
  // Sử dụng RxInt để trạng thái trở thành phản ứng
  var leftDiceNumber = 1.obs;
  var rightDiceNumber = 1.obs;

  void rollDiceLeft() {
    leftDiceNumber.value = Random().nextInt(6) + 1;
  }

  void rollDiceRight() {
    rightDiceNumber.value = Random().nextInt(6) + 1;
  }

  void rollDice() {
    leftDiceNumber.value = Random().nextInt(6) + 1;
    rightDiceNumber.value = Random().nextInt(6) + 1;
  }
}
