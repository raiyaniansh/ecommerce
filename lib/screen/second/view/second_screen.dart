import 'package:apipost/screen/home/modal/home_modal.dart';
import 'package:apipost/screen/home/provider/home_provider.dart';
import 'package:apipost/screen/second/modal/second_modal.dart';
import 'package:apipost/screen/second/provider/second_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  SecondProvider? secondProviderf;
  SecondProvider? secondProvidert;
  @override
  Widget build(BuildContext context) {
    HomeModal s1 = ModalRoute.of(context)!.settings.arguments as HomeModal;
    secondProviderf = Provider.of<SecondProvider>(context,listen: false);
    secondProvidert = Provider.of<SecondProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10,right: 15),
              child: Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back_ios_new_sharp))
                ],
              ),
            ),
            Container(
              height: 400,
              color: Colors.white,
              child: Image.network('https://s.yimg.com/fz/api/res/1.2/kfa68EyKDl_RjpiAU1cT.Q--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpdDtoPTI0MDtxPTgwO3c9MjQw/https://s.yimg.com/zb/imgv1/f3fb234d-9219-3c59-b9bf-17dfd46b3533/t_500x300'),
            ),
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.grey.shade100
              ),
              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${s1.productName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      IconButton(onPressed: () {
                        Provider.of<HomeProvider>(context,listen: false).addCart(s1);
                      }, icon: Icon(Icons.shopping_cart))
                    ],
                  ),
                  SizedBox(height: 2,),
                  Text("${s1.productCategory}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                  SizedBox(height: 10,),
                  Text("Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  SizedBox(height: 5,),
                  Text("Rs. ${s1.productPrice}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text("Rate",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  SizedBox(height: 5,),
                  Text("${s1.productRate} star",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text("Desciption",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  SizedBox(height: 5,),
                  Text("${s1.productDesc}",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("Offers",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                  SizedBox(height: 5,),
                  Text("Rs. ${s1.productOffer}",style: TextStyle(fontSize: 18),),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(onTap: () {
                              secondProviderf!.Changeremove();
                            },child: Text("-",style: TextStyle(fontSize: 40,color: Colors.grey),)),
                            Text("${secondProvidert!.i}",style: TextStyle(fontSize: 25)),
                            InkWell(onTap: () {
                              secondProviderf!.Changeadd();
                            },child: Text("+",style: TextStyle(fontSize: 40,color: Colors.grey),)),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(width: 230,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),alignment: Alignment.center,child: Text("Buy Now",style: TextStyle(fontSize: 18)),),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
