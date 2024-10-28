import 'package:flutter/material.dart';

BoxDecoration widgetDecoration(Color color) {
  return BoxDecoration(
    //DecorationImage
    border: Border.all(
      color: color,
      width: 8,
    ), //Border.all
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        offset: const Offset(
          5.0,
          5.0,
        ), //Offset
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.white,
        offset: const Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
  );
}
