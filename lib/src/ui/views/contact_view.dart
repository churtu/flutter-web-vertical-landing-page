import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.pinkAccent,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'Contact View',
          style: GoogleFonts.montserratAlternates(
            fontSize: 80,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
    );
  }
}