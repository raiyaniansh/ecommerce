import 'package:apipost/screen/home/modal/home_modal.dart';
import 'package:apipost/screen/home/provider/home_provider.dart';
import 'package:apipost/screen/second/modal/second_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderf;
  HomeProvider? homeProvidert;

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context, listen: false);
    homeProvidert = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          leading: Builder(
            builder: (context) => InkWell(
                onTap: () => Scaffold.of(context).openDrawer()    ,
                child: Icon(Icons.menu,color: Colors.black,)),
          ),
          title: Text(
            "Day deals",
            style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.search,color: Colors.black26,),
                        SizedBox(width: 5,),
                        Text("Search for product",style: TextStyle(color: Colors.black26),)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.filter_list_outlined),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List? data = snapshot.data;
                    return Expanded(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            HomeModal s1 = HomeModal(id: data[index].id,productCategory: data[index].productCategory,productDesc: data[index].productDesc,productImage: data[index].productImage,productName: data[index].productName,productOffer: data[index].productOffer,productPrice: data[index].productPrice,productRate: data[index].productRate);
                            Navigator.pushNamed(context, 'second',arguments: s1);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                  ),
                                  child: Image.network('https://s.yimg.com/fz/api/res/1.2/kfa68EyKDl_RjpiAU1cT.Q--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpdDtoPTI0MDtxPTgwO3c9MjQw/https://s.yimg.com/zb/imgv1/f3fb234d-9219-3c59-b9bf-17dfd46b3533/t_500x300',fit: BoxFit.cover),
                                ),
                                Text(
                                  "  ${data[index].productName}",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                                SizedBox(height: 1,),
                                Text(
                                  "   ${data[index].productCategory}",
                                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54,fontSize: 15),
                                ),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Text(
                                      "  Rs. ${data[index].productPrice}",
                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                                    ),
                                    Expanded(child: SizedBox()),
                                    InkWell(onTap: () {
                                      HomeModal m1 = data[index];
                                      homeProviderf!.addCart(m1);
                                    },child: Container(height: 25,width: 25,alignment: Alignment.center,decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),child: Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 17,),)),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                                SizedBox(height: 5,)
                              ],
                            ),
                          ),
                        ),
                        itemCount: data!.length,
                      ),
                    );
                  }
                  return Container(height: 615,alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.black,));
                },
                future: homeProviderf!.Apicalling(),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 125,
                  color: Colors.white,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(10),
                  child: Text("Welcome to,\nDay deals",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 125,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trending",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      SizedBox(height: 20,),
                      Text("Best Sellers",style: TextStyle(fontSize: 20)),
                      Text("New Releases",style: TextStyle(fontSize: 20)),
                      Text("Movers and Shakers",style: TextStyle(fontSize: 20)),

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 159,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Top Categories for you",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      SizedBox(height: 20,),
                      Text("Mobiles",style: TextStyle(fontSize: 20)),
                      Text("Computers",style: TextStyle(fontSize: 20)),
                      Text("Book",style: TextStyle(fontSize: 20)),
                      Text("Fashion",style: TextStyle(fontSize: 20)),
                      Text("See all Categories",style: TextStyle(fontSize: 20)),

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 140,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Program & Features",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      SizedBox(height: 20,),
                      Text("Today's Deals",style: TextStyle(fontSize: 20)),
                      Text("Try Prime",style: TextStyle(fontSize: 20)),
                      Text("Top Day Deals",style: TextStyle(fontSize: 20)),
                      Text("Top Week Deals",style: TextStyle(fontSize: 20)),

                    ],
                  ),
                ),
                Expanded(child: SizedBox(height: 15,)),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      Icon(Icons.logout),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
