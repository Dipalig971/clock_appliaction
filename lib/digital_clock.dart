
import 'dart:async';

import 'package:flutter/material.dart';

class Digital_clock extends StatefulWidget {
  const Digital_clock({super.key});

  @override
  State<Digital_clock> createState() => _Digital_clockState();
}

DateTime dateTime=DateTime.now();
class _Digital_clockState extends State<Digital_clock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic( Duration(seconds: 1), (timer) {
      setState(() {
        dateTime=DateTime.now();
      });
    });
    return Scaffold(
     // backgroundColor: Color(0xff619798),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('Clock App',style: TextStyle(color: Color(0xff619798),fontSize: 30,fontWeight: FontWeight.w700),)),
        ),
        body: Stack(
          children: [
          Center(
            child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff609394), width: 8),
              shape: BoxShape.circle,
            ),
            ),
          ),
            // SizedBox(
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     child: Image.asset('asset/img/tree.jpg',fit: BoxFit.cover,)),
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text('${dateTime.day}-${dateTime.month}-${dateTime.year}',style: TextStyle(color: Color(0xff619798),fontSize: 30,fontWeight: FontWeight.bold),),
            )),
            Center(child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text('${dateTime.hour%12} : ${dateTime.minute} : ${dateTime.second}',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600),),
            )),
            Center(child: Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text('${dateTime.hour<12?"Am":"Pm"}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),),
            )),
          ],
        ),
    );
  }
}
