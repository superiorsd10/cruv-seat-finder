import 'package:flutter/material.dart';
import 'hive_database.dart';

class SeatFinderData extends ChangeNotifier{
  final db = HiveDatabase();

  void initializeData(){
    db.saveSeatNumber(0);
  }

  int getSeatNumber(){
    return db.getSeatNumber();
  }

  void saveSeatNumber(int seatNumber){
    notifyListeners(); 
    db.saveSeatNumber(seatNumber); 
  }
}