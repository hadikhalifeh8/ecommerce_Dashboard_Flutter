import 'package:ecommerce_dashboard/core/constant/imageasset.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/view/widget/Home/cardAdminHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(appBar: AppBar(title: Text("Orders Pending"),),); //scaffold فش داعي لل 


    return Scaffold(appBar: AppBar(title: Text("Home"),
    centerTitle: true,
    
    ),

    body:
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 130.0),

            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            
            
   
                          
                      children: [



                CardAdminHome(image: (AppImageAsset.categories), title: "categories", onClick: (){Get.toNamed(AppRoute.viewcategory);}),        


                CardAdminHome(image: (AppImageAsset.products), title: "Products", onClick: (){}),    


                CardAdminHome(image: (AppImageAsset.users), title: "users", onClick: (){}),


                CardAdminHome(image: (AppImageAsset.orders), title: "Orders", onClick: (){}),


                CardAdminHome(image: (AppImageAsset.reports), title: "Reportss", onClick: (){}), 


                CardAdminHome(image: (AppImageAsset.messagins), title: "Messaging", onClick: (){}), 


                CardAdminHome(image: (AppImageAsset.notifications), title: "Notification", onClick: (){},),  








                  


                          // InkWell(
                          //   onTap: (){},
                          //   child: Card(
                          
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Image.asset(AppImageAsset.avatar, width: 80.0,),
                          //    //Lottie.asset(AppImageAsset.avatar, height: 80.0,width: 80.0,),
                          //     const Text("Messaging")
                          //   ],
                          //                       ),
                          //                         ),
                          // ),


    




                          

                                
                        
                        
                        ],    


    
    )
    
    
    );
  }
}