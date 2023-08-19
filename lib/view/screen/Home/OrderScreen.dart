import 'dart:io';

import 'package:ecommerce_dashboard/controller/orders/OrderScreenController.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';

import 'package:ecommerce_dashboard/view/widget/auth/Orders/customButtonAppBarHome2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(OrderScreenControllerImp());
   
   return  GetBuilder<OrderScreenControllerImp>(builder: (controller) => 
   
          Scaffold(
            appBar: AppBar(title: const Text("Orders"),
            ),
    
    
   bottomNavigationBar: CustomButtonAppBarHome(),
    
    body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage),
    onWillPop: (){
       Get.defaultDialog(
                         title: "Warning",
                         titleStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColor.primaryColor),

                         middleText: "Are You Sure Exit App",
                         middleTextStyle: const TextStyle(fontSize: 16.0),


                         onConfirm: (){exit(0);},
                         confirmTextColor: Colors.black,

                         onCancel: (){},
                         cancelTextColor: Colors.blue,

                          buttonColor: Colors.blueAccent,

      
      );
      return Future.value(false);
    })
    
    
    ),
          );
   
   
      // la etna2al ben lsaf7at
    
    
   
    

  }
}