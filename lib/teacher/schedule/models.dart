import 'package:flutter/cupertino.dart';

class Period {
  Period(name, length){
    //const Period({Key? key, required this.name, required this.l}) : super(key: key);
    this.name = name;
    this.lengthInMinutes = length;
  }

  late String name;
  late int lengthInMinutes;

  late DateTime startsAt;
 late DateTime endsAt;
}