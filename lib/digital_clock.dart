
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Clock App',style: TextStyle(color: Colors.white,fontSize: 25),),
        ),
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('asset/img/tree.jpg',fit: BoxFit.cover,)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90,horizontal: 30),
              child: Text('${dateTime.day}-${dateTime.month}-${dateTime.year}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: Text('${dateTime.hour%12} : ${dateTime.minute} : ${dateTime.second}',style: TextStyle(fontSize: 45,color: Colors.white,fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 270,top: 35),
              child: Text('${dateTime.hour<12?"Am":"Pm"}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
            ),
          ],
        ),
    );
  }
}
