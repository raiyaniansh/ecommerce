import 'package:apipost/screen/bottom/provider/bottom_provider.dart';
import 'package:apipost/screen/bottom/view/bottom_screen.dart';
import 'package:apipost/screen/home/provider/home_provider.dart';
import 'package:apipost/screen/home/view/home_screen.dart';
import 'package:apipost/screen/second/provider/second_provider.dart';
import 'package:apipost/screen/second/view/second_screen.dart';
import 'package:apipost/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => SecondProvider(),),
        ChangeNotifierProvider(create: (context) => BottomProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Splash_screen(),
          'bottom':(context) => BottomScreen(),
          'second':(context) => SecondScreen(),
        },
      ),
    ),
  );
}
