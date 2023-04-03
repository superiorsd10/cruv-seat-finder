import 'package:cruv_assignment_project/constants.dart';
import 'package:cruv_assignment_project/data/seat_finder_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Seat extends StatefulWidget {
  const Seat({
    super.key,
    required this.height,
    required this.width,
    required this.seatNumber,
    required this.seatType,
    required this.seatUp,
  });
  final double height;
  final double width;
  final String seatNumber;
  final String seatType;
  final bool seatUp;

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  late int chosenSeatNumber;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Assigning the seat number chosen by the user
    chosenSeatNumber = Provider.of<SeatFinderData>(context).getSeatNumber();

    return Container(
      height: widget.height / 11,
      width: widget.width / 7,
      decoration: BoxDecoration(
        color: chosenSeatNumber == int.parse(widget.seatNumber)
            ? GlobalVariables.resultantSeatColor
            : GlobalVariables.seatColor,
        border: Border.all(
          width: 2,
          color: GlobalVariables.seatBackgroundColor!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // If the seat does belongs to the third or fourth group
          !widget.seatUp ? const SizedBox(height: 7) : const SizedBox(),
          !widget.seatUp
              ? Text(
                  widget.seatType,
                  style: GoogleFonts.barlow(
                    color:
                        chosenSeatNumber == int.parse(widget.seatNumber)
                            ? GlobalVariables.whiteColor
                            : GlobalVariables.seatTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
          const SizedBox(height: 7),

          // Works for all four seat groups
          Text(
            widget.seatNumber,
            style: GoogleFonts.barlow(
              color: chosenSeatNumber == int.parse(widget.seatNumber)
                  ? GlobalVariables.whiteColor
                  : GlobalVariables.seatTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 7),

          // If the seat does belongs to the first or second group
          widget.seatUp
              ? Text(
                  widget.seatType,
                  style: GoogleFonts.barlow(
                    color:
                        chosenSeatNumber == int.parse(widget.seatNumber)
                            ? GlobalVariables.whiteColor
                            : GlobalVariables.seatTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
          widget.seatUp ? const SizedBox(height: 7) : const SizedBox(),
        ],
      ),
    );
  }
}
