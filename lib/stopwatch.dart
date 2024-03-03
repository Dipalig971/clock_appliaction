// import 'package:analogus_clock_app/clockapp.dart';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 90),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  shape: BoxShape.circle),
              // child: Center(
              //   child: Text(
              //    // '${dateTime.minute} : ${dateTime.second} : ${dateTime.millisecond}',
              //   //   style: TextStyle(
              //   //       color: Colors.black,
              //   //       fontWeight: FontWeight.bold,
              //   //       fontSize: 40),
              //   // ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
