// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/product_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    title: "Suthicha - Assignment05",
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
final ProductController mycontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.android),
        title: Text("My Assignment05 - Suthicha "),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.list), label: "Product"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping), label: "Cart"),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Product Name"),
                Container(
                    width: 120,
                    child: TextField(
                      controller: mycontroller.textProductName,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Price"),
                Container(
                    width: 120,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
              ],
            ),
            ElevatedButton(onPressed: () {
              mycontroller.addProduct();
              print(mycontroller.productName);
            }, child: Text("Add")),
            Expanded(
              child:
              Obx(() => ListView.builder(
                itemCount: mycontroller.productName.length,
                itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: (index%2==0)?Colors.white24:Colors.teal,
                  margin: EdgeInsets.all(15),
                  height: 70,
                  child: Text(" ${mycontroller.productName[index]}"),
                );
              },),
            ),
            )
      ]),

      ),
    );
  }
}