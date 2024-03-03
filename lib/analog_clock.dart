
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

DateTime dateTime = DateTime.now();

class _ClockAppState extends State<ClockApp> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Clock App'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/img/clock.jpg'),fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 310,
                width: 310,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "asset/img/bg2.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 2),
                    ]),
                child: Stack(
                  children: [
                    // ...List.generate(
                    //   60,
                    //   (index) => Transform.rotate(
                    //     angle: index * 6 * pi / 180,
                    //     child: Center(
                    //       child: VerticalDivider(
                    //         //color:
                    //           //  (index % 5 == 0) ? Color(0xffFF8FBF) : Colors.black,
                    //         // thickness: (index % 5 == 0) ? 5 : 4,
                    //         // indent: (index % 5 == 0) ? 290 : 301,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 10,
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.second * 6 * pi / 180,
                        child: const VerticalDivider(
                          color: Color(0xffF7B0BB),
                          thickness: 3,
                          indent: 60,
                          endIndent: 120,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: dateTime.minute * 6 * pi / 180,
                        child: const VerticalDivider(
                          color: Colors.black,
                          thickness: 4,
                          indent: 65,
                          endIndent: 130,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: (dateTime.hour % 12 + dateTime.minute / 60) *
                            30 *
                            pi /
                            180,
                        child: const VerticalDivider(
                          color: Colors.black,
                          thickness: 6,
                          indent: 75,
                          endIndent: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}',
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${dateTime.hour < 12 ? " Am" : " Pm"}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
