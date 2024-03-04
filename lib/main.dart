import 'dart:async';

import 'package:clock_appliaction/Stop_watch.dart';
import 'package:clock_appliaction/analog_clock.dart';
import 'package:clock_appliaction/digital_clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Digital_clock(),
    )
  );
}
