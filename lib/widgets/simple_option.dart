import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleOption extends StatelessWidget {
  final String text;
  final bool selected;

  const SingleOption({Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      height: 38,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFF4317) : Colors.white,
        border: selected
            ? null
            : Border.all(
                color:
                    selected ? const Color(0xFFFF4317) : Colors.grey.shade300,
                width: selected ? 0 : 1, // Cambiado de null a 0
              ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
