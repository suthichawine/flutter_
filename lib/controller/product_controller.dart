import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<String>productName=<String>["Pizza","Berger","Spagetthi"].obs;
  final textProductName = TextEditingController();

  void addProduct(){
   productName.add(textProductName.text);
  }
}
