import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase{
  final _myBox = Hive.box('seat_finder_database');

  void saveSeatNumber(int seatNumber){
    _myBox.put('SEAT_NUMBER', seatNumber); 
  }

  int getSeatNumber(){
    return _myBox.get('SEAT_NUMBER');
  }
}