import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'Pricing View',
          style: GoogleFonts.montserratAlternates(
            fontSize: 80,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
    );
  }
}