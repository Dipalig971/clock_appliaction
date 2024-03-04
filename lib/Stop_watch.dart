import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
  }

  void startTimer() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
      timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
        setState(() {});
      });
    }
  }

  void stopTimer() {
    if (stopwatch.isRunning) {
      timer.cancel();
      stopwatch.stop();
      stopwatch.stop();
    }
  }

  void resetTimer() {
    if (!stopwatch.isRunning) {
      stopwatch.reset();
      setState(() {});
    }
  }

  String format() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(2, '0');
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, '0');
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, '0');
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Stopwatch',
            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff609394),fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 90),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff609394), width: 8),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text((format()),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20,),
              InkWell(
                onTap: () {
                  (!stopwatch.isRunning)?startTimer():stopTimer();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 110),
                  child: Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color: (!stopwatch.isRunning)?Color(0xff609394):Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text((!stopwatch.isRunning)?'Start':'Stop',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  resetTimer();
                },
                child: Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Color(0xff609394),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Restart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: StopWatch(),
//   ));
// }
