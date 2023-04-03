import 'package:cruv_assignment_project/constants.dart';
import 'package:cruv_assignment_project/data/seat_finder_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'screens/seat_finder_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // For working in vertical orientation only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  // Setting the Status Bar Theme
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        GlobalVariables.whiteColor, // navigation bar color
    statusBarColor: GlobalVariables.whiteColor, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  // Initializing the Hive Flutter
  await Hive.initFlutter();

  // Opening a Hive Box
  await Hive.openBox('seat_finder_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeatFinderData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SeatFinderScreen(),
      ),
    );
  }
}
