import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX để sử dụng Get.to
import 'package:multiplatform_vku/lab/lab_2/mi_card.dart';
import '../../utils/constants/image_strings.dart';

class IAmRich extends StatelessWidget {
  const IAmRich({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab 1',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am Rich',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Image(
              image: AssetImage(HpImages.iAmRich),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.to(() => const MiCard()),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              child: const Text(
                'Lab 2',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
