// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_dashboard/controller/orders/acceptedOrders_Controller.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/data/model/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:jiffy/jiffy.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersAcceptingController controller = Get.put(OrdersAcceptingController());
    return 
    //Scaffold(
               // appBar: AppBar(title: const Text("Orders")),
               //body: 
               Container(padding: EdgeInsets.all(10.0),
                
                child:  GetBuilder<OrdersAcceptingController>(builder: (controller) => 
               
                HandlingDataView(statusRequest: controller.statusRequest, 
                
                widget:  ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersList(listdata: controller.data[index],)
                  )

                  ),
                //]
                )
               

             );
               
    
    
    
    
  }
}

class CardOrdersList extends GetView<OrdersAcceptingController> {
  final OrdersModel listdata;
  const CardOrdersList({
    Key? key,
    required this.listdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return        Card(child:
               Container(
                
                
                padding: EdgeInsets.all(10.0),
                child: 
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(children: [
                           Text("Order Number : ${listdata.id}", style: const TextStyle(fontSize: 18),),
                           Spacer(),
                         
                          // Text("${listdata.orderDate}"),
                          //  Text("${Jiffy("2011-10-31", "yyyy-MM-dd").fromNow()}"),
                           Text(Jiffy(listdata.orderDate, "yyyy-MM-dd").fromNow(),
                           style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                           
                           ),

                        ],),
                      const Divider(),

                       //Text("Order Type : ${listdata.orderType}"),
                       //Order Type = 0 (delivery) ما بيظهر إلا إذا كان
                       Text("Order Type : ${controller.printOrderType(listdata.orderType.toString())}" ),

                        Text("Order price : ${listdata.orderPrice} \$"),


                       Text("Delivery price : ${listdata.orderPriceDelivery} \$"),

                       Text("payment Method : ${controller.printPaymentMethod(listdata.paymentMethod.toString())}"),

                      // Text("Status : ${controller.printOrderStatus(listdata.status.toString())}"),

                       
                       
                       Divider(),
                       Row(
                         children: [
                           Text("total Price : ${listdata.totalPrice}\$", style:TextStyle(color: AppColor.primaryColor)),
                           Spacer(),
                           MaterialButton(color: AppColor.secoundColor, 
                           onPressed: (){
                            //لجيب المعلومات function أحسن ما إرجع إعمل 
                            // detailsOrder_controller

                                    Get.toNamed(AppRoute.detailsOrder, 
                                     arguments: {"Model_Of_Order_list" : listdata});
                           } , 
                           child: Text("Details", style: TextStyle(color: AppColor.backgroundColor),),
                           ),

                         
                       
                         
                         const SizedBox(width: 10.0,),
                         // if order status => Await Approve then show delete buton else hide
                         
                        //  if(listdata.status.toString() == "2")
                        //         MaterialButton(color: AppColor.greyColors, 
                        //    onPressed: (){
                        //                // controller.deleteOrder(listdata.id.toString());
                        //                 controller.approvedOrders(listdata.id.toString(), listdata.userId.toString());

                        //    } , 
                        //    child: Text("Approve", style: TextStyle(color: AppColor.primaryColor),),
                        //    ),



                           if(listdata.status.toString() == "3")
                                MaterialButton(color: AppColor.secoundColor, 
                           onPressed: (){
                                       // controller.deleteOrder(listdata.id.toString());
                                        controller.preparedOrder(listdata.id.toString(), listdata.userId.toString(),listdata.orderType.toString());

                           } , 
                           child: Text("Done", style: TextStyle(color: AppColor.backgroundColor),),
                           ),
                         
                         ],
                       ),




                    ],)
                    
                    ),);
  }
}
