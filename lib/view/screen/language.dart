import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/language/customButtonLanguages.dart';

class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const  EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
           Text("1".tr, style: Theme.of(context).textTheme.headline1,),
          const SizedBox(height: 20.0,),
          CustomButtonLanguage(textbuttonName: "Ar",
          onPressed: (){ 
                       controller.changeLanguage("ar");
                       Get.toNamed(AppRoute.login);
          }),
          const SizedBox(height: 5.0,),
          CustomButtonLanguage(textbuttonName: "En",
          onPressed: (){
            controller.changeLanguage("en");
            Get.toNamed(AppRoute.login);
          }
          ),
          

        ],),
      ),
    );
  }
}