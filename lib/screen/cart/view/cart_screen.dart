import 'package:apipost/screen/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? homeProviderf;
  HomeProvider? homeProvidert;
  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context,listen: false);
    homeProvidert = Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          title: Text(
            "Day deals",
            style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("My cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.network('https://s.yimg.com/fz/api/res/1.2/kfa68EyKDl_RjpiAU1cT.Q--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpdDtoPTI0MDtxPTgwO3c9MjQw/https://s.yimg.com/zb/imgv1/f3fb234d-9219-3c59-b9bf-17dfd46b3533/t_500x300',fit: BoxFit.cover),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  ${homeProviderf!.cart[index].productName}",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          SizedBox(height: 1,),
                          Text(
                            "   ${homeProviderf!.cart[index].productCategory}",
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54,fontSize: 15),
                          ),
                          SizedBox(height: 2,),
                          Text(
                            "  Rs. ${homeProviderf!.cart[index].productPrice}",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(onTap: () {
                        homeProviderf!.removeCart(index);
                      },child: Icon(Icons.delete))
                    ],
                  ),
                );
              },
                itemCount: homeProviderf!.cart.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
