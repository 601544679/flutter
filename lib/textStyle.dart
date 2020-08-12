import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
Text textStyle({String s, double size, TextAlign align, Color color}) {
  var textsy = Text(
    s,
    style:
    TextStyle(fontSize: size, color: color == null ? Colors.black : color),
    textAlign: align,
  );
  return textsy;
}
String date(int millTime) {
  DateTime a = DateTime.fromMillisecondsSinceEpoch(millTime);
  a.year;
  a.month;
  a.day;
  return (formatDate(
      DateTime(a.year, a.month, a.day), [yyyy, '年', mm, '月', dd, '日']));
}