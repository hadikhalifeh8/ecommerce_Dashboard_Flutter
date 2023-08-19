
import 'package:ecommerce_dashboard/view/screen/Home/home.dart';
import 'package:ecommerce_dashboard/view/screen/Home/OrderScreen.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController{

changePage(int currentpage);

}

class OrderScreenControllerImp extends OrderScreenController{

  int currentpage = 0; 

// list of pages
List<Widget> listPage =[

//  const  OrdersPending(),
// const OrdersAccepted(),
Text(""),


 
//   Home(),
//  Column(children: [
//   Center(child: Text("Orders")),

//  ],), 
//   Column(children: [
//   Center(child: Text("setting")),

//  ],)


 

];


List listBottomAppBar = [
   // group of maps
  // "home" ,
  // "homesss" , 
  { "title" : "Pending", "icon" : Icons.bookmark_add,},
  {"title" : "Acccepted", "icon" : Icons.add_task_sharp,}, 
     {"title" : "Settings", "icon" : Icons.settings,},

 


];

  @override
  changePage(int inde_x) {
       currentpage = inde_x;
       update();
  }

}

