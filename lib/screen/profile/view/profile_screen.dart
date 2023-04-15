import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                CircleAvatar(backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.UzuYMXdB3DPUnPOewhakCwHaFe&pid=Api&P=0'),maxRadius: 65,),
                SizedBox(height: 10,),
                Text("Nicolas Admas",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                SizedBox(height: 3,),
                Text("nicolasadmas@gmail.com",style: TextStyle(fontSize: 16,color: Colors.grey)),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Text("Upgrade to Pro",style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
                SizedBox(height: 25,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.privacy_tip_outlined),
                      SizedBox(width: 10,),
                      Text("Privacy",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(width: 10,),
                      Text("Purchas History",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline),
                      SizedBox(width: 10,),
                      Text("Help & Support",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined),
                      SizedBox(width: 10,),
                      Text("Privacy",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_add_alt),
                      SizedBox(width: 10,),
                      Text("Invite a Friend",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10,),
                      Text("Logout",style: TextStyle(fontSize: 18)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.navigate_next,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
