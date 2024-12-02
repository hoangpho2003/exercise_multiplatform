import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({
    super.key, required this.text, required this.icon,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: GoogleFonts.sourceSans3(
              fontSize: 20.0,
              color: Colors.teal.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
