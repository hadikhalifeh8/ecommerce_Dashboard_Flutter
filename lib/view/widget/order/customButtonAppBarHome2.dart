
import 'package:ecommerce_dashboard/controller/orders/OrderScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CustomButtonAppBar.dart';

class CustomButtonAppBarHome extends GetView<OrderScreenControllerImp> {
  const CustomButtonAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child:  Row(children: [

SizedBox(width: 40.0,),
    ...List.generate( 
                    controller.listPage.length , 
                
                 (index) =>  

                  
                           CustomButtonAppBar( 
                            
                             textButton: controller.listBottomAppBar[index]['title'], 
                            
                            iconData: controller.listBottomAppBar[index]['icon'], 
                            
                             onPressed: () 
                             {
                              controller.changePage(index);
                              
                              }, 
                             
                             activeColor: controller.currentpage == index ? true : false,
                            )


                        
      )
   
    

    //   // Pending Orders
    //     CustomButtonAppBar(
    //                          textButton: "Pending Orders", 
                            
    //                         iconData: Icons.work_history_rounded, 
                            
    //                          onPressed: () 
    //                          {
    //                           controller.changePage(0);
    //                           }, 
                             
    //                          activeColor: controller.currentpage == 0 ? true : false,
    //                         ),
      
    //  // Spacer(),
        
    //     // Accepted Orders
    //     CustomButtonAppBar(
    //                          textButton: "Accepted Orders", 
    //                          iconData: Icons.work_history_rounded, 
    //                          onPressed: () {
    //                           controller.changePage(1);
    //                          }, 
    //                          activeColor: controller.currentpage == 1 ? true : false,
    //                         ),

    ],
    ),

    );
  }
}