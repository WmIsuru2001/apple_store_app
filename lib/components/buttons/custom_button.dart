import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    required this.text,
    this.bgcolor = Colors.black,
    this.fontColor = Colors.white,
    this.borderColor = Colors.black,
    this.ontap,
  });

  final Size size;
  final String text;
  final Color bgcolor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: bgcolor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: fontColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
