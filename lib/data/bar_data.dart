import 'package:flutter/material.dart';
import 'package:fm_chart/model/bar_data_model.dart';

class Bardata {
  static int interval = 22;
  static List<Data> bardata = [
    Data(id: 0, name: 'Mon', y: 15, color: Colors.greenAccent),
    Data(id: 1, name: 'Tue', y: -12, color: Colors.green),
    Data(id: 2, name: 'Wed', y: 11, color: Colors.blue),
    Data(id: 3, name: 'Thus', y: 16, color: Colors.green),
    Data(id: 4, name: 'Fri', y: -10, color: Colors.blueGrey),
  ];
}
