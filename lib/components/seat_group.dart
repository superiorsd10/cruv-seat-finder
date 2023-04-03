import 'package:cruv_assignment_project/components/seat.dart';
import 'package:cruv_assignment_project/constants.dart';
import 'package:flutter/material.dart';

class SeatGroup extends StatefulWidget {
  const SeatGroup({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<SeatGroup> createState() => _SeatGroupState();
}

class _SeatGroupState extends State<SeatGroup> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  // Seat Background Box
                  Container(
                    width: width / 2.07,
                    height: height / 19,
                    decoration: BoxDecoration(
                      color: GlobalVariables.seatBackgroundColor!,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // First Seat Group
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 1).toString(),
                          seatType: 'LOWER',
                          seatUp: true,
                        ),
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 2).toString(),
                          seatType: 'MIDDLE',
                          seatUp: true,
                        ),
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 3).toString(),
                          seatType: 'UPPER',
                          seatUp: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: width / 4.6),
              Stack(
                children: [
                  // Second Seat Group
                  Container(
                    width: width / 5.3,
                    height: height / 19,
                    decoration: BoxDecoration(
                      color: GlobalVariables.seatBackgroundColor!,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Seat(
                      height: height,
                      width: width,
                      seatNumber: (widget.index * 8 + 7).toString(),
                      seatType: 'SIDE LOWER',
                      seatUp: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height / 40),
          Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: height / 15,
                    child: Container(
                      width: width / 2.07,
                      height: height / 19,
                      decoration: BoxDecoration(
                        color: GlobalVariables.seatBackgroundColor!,
                      ),
                    ),
                  ),

                  // Third Seat Group
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 4).toString(),
                          seatType: 'LOWER',
                          seatUp: false,
                        ),
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 5).toString(),
                          seatType: 'MIDDLE',
                          seatUp: false,
                        ),
                        Seat(
                          height: height,
                          width: width,
                          seatNumber: (widget.index * 8 + 6).toString(),
                          seatType: 'UPPER',
                          seatUp: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: width / 4.6),
              Stack(
                children: [
                  Positioned(
                    top: height / 15,
                    child: Container(
                      width: width / 5.3,
                      height: height / 19,
                      decoration: BoxDecoration(
                        color: GlobalVariables.seatBackgroundColor!,
                      ),
                    ),
                  ),

                  // Fourth Seat Group
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Seat(
                      height: height,
                      width: width,
                      seatNumber: (widget.index * 8 + 8).toString(),
                      seatType: 'SIDE UPPER',
                      seatUp: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
