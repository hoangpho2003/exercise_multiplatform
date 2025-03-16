import 'package:flutter/material.dart';
import 'package:multiplatform_vku/lab/lab_8/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: const LoadingScreen());
  }
}
