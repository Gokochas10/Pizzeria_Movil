import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final IconData icon;
  final bool iconVisible;
  final Color textColor;

  CustomButton({
    required this.color,
    required this.text,
    required this.textColor,
    required this.onPressed,
    required this.iconVisible,
    this.icon = Icons.arrow_forward_ios,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconVisible ? Icon(icon) : Container(),
          Text(
            text,
            style: GoogleFonts.inter(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
