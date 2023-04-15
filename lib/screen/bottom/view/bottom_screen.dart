import 'package:apipost/screen/bottom/provider/bottom_provider.dart';
import 'package:apipost/screen/cart/view/cart_screen.dart';
import 'package:apipost/screen/home/view/home_screen.dart';
import 'package:apipost/screen/profile/view/profile_screen.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  BottomProvider? bottomProviderf;
  BottomProvider? bottomProvidert;
  List screen = [HomeScreen(),CartScreen(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    bottomProvidert = Provider.of<BottomProvider>(context, listen: true);
    bottomProviderf = Provider.of<BottomProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: screen[bottomProvidert!.i],
        bottomNavigationBar: BottomBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.grey.shade100,
          selectedIndex: bottomProvidert!.i,
          items: [
            BottomBarItem(
                icon: Icon(Icons.home),
                inactiveColor: Colors.black54,
                title: Text("Home"),
                activeColor: Colors.black),
            BottomBarItem(
                icon: Icon(Icons.shopping_cart_sharp),
                inactiveColor: Colors.black54,
                title: Text("Cart"),
                activeColor: Colors.black),
            BottomBarItem(
                icon: Icon(Icons.person),
                inactiveColor: Colors.black54,
                title: Text("Profile"),
                activeColor: Colors.black),
          ],
          onTap: (value) {
            bottomProviderf!.ChangeIndex(value);
          },
        ),
      ),
    );
  }
}
