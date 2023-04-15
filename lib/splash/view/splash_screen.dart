import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'bottom');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 250,),
              Image.asset('assets/images/logopng.png',height: 150,color: Colors.black),
              SizedBox(height: 250,),
              Text("Day dels",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              CircularProgressIndicator(color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }
}
