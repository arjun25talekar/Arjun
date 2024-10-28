import 'package:flutter/material.dart';

extension CommonExtension on BuildContext {
  double getWidth({double percentage = 1}) {
    return MediaQuery.of(this).size.width * percentage;
  }

  double getHeight({double percentage = 1}) {
    return MediaQuery.of(this).size.height * percentage;
  }
}
