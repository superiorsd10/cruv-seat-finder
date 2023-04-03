import 'package:cruv_assignment_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: GoogleFonts.barlow(
          color: GlobalVariables.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: GlobalVariables.seatBackgroundColor,
    ),
  );
}
