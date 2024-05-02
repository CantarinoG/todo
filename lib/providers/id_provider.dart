import 'dart:math';
import 'package:flutter/material.dart';

class IdProvider with ChangeNotifier {
  IdProvider();
  int generate() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomBits = Random().nextInt(1 << 31);
    return (timestamp << 31) | randomBits;
  }
}
