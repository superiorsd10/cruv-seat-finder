import 'package:cruv_assignment_project/components/seat_group.dart';
import 'package:cruv_assignment_project/components/snackbar.dart';
import 'package:cruv_assignment_project/constants.dart';
import 'package:cruv_assignment_project/data/seat_finder_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SeatFinderScreen extends StatefulWidget {
  const SeatFinderScreen({super.key});

  @override
  State<SeatFinderScreen> createState() => _SeatFinderScreenState();
}

class _SeatFinderScreenState extends State<SeatFinderScreen> {
  final _formkey = GlobalKey<FormState>();
  final _seatNumberController = TextEditingController();
  late String seatNumber;
  final _scrollController = ScrollController();
  final _scrollControllerSeatGroup = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initializing the seat number variable
    Provider.of<SeatFinderData>(context, listen: false).initializeData();
  }

  @override
  void dispose() {
    super.dispose();
    _seatNumberController.dispose();
    _scrollController.dispose();
    _scrollControllerSeatGroup.dispose();
  }

  void clearText(){
    _seatNumberController.clear();
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: GlobalVariables.whiteColor,
          elevation: 0,
          title: const Text('Seat Finder'),
          titleTextStyle: GoogleFonts.barlow(
            color: GlobalVariables.seatBackgroundColor,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              controller: _scrollController,
              children: [
                SizedBox(height: height / 40),
                Form(
                  key: _formkey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height / 15,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: GlobalVariables.seatBackgroundColor!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.barlow(
                                  color: GlobalVariables.seatBackgroundColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter seat number',
                                  hintStyle: GoogleFonts.barlow(
                                    color: GlobalVariables.seatBackgroundColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  errorStyle: GoogleFonts.barlow(
                                    color: GlobalVariables.redColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                controller: _seatNumberController,
                                onChanged: (value) {
                                  seatNumber = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    showSnackBar(
                                        message: 'Please enter seat number!',
                                        context: context);
                                  } else if (int.parse(value) < 0 ||
                                      int.parse(value) > 32) {
                                    showSnackBar(
                                        message:
                                            'Please enter a valid seat number!',
                                        context: context);
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // If the seat number is valid
                          if (_formkey.currentState!.validate()) {
                            int seatNumberConverted = int.parse(seatNumber);
                            num seatGroupIndex = seatNumberConverted % 8 == 0
                                ? (seatNumberConverted / 8) - 1
                                : seatNumberConverted / 8;


                            if (seatGroupIndex.toInt() == 2 || seatGroupIndex.toInt() == 3) {
                              _scrollDown();
                            }
                            Provider.of<SeatFinderData>(context, listen: false).saveSeatNumber(seatNumberConverted); 
                          }

                          // Clearing the text in textfield on tapping the text button
                          clearText();

                          // For dismissing the keyboard on tapping the find button
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Container(
                          height: height / 15,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: GlobalVariables.seatBackgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Find',
                              style: GoogleFonts.barlow(
                                color: GlobalVariables.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),

                // Placing all the seats
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  controller: _scrollControllerSeatGroup,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: SeatGroup(
                      index: index,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
