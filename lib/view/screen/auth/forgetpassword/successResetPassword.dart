import 'package:ecommerce_dashboard/controller/auth/forget%20password/successResetPasswordController.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextBodyauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRestPassword extends StatelessWidget {
  const SuccessRestPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
                backgroundColor: AppColor.grey,
                elevation: 0,
                centerTitle: true,
                title: Text("Success Reset", style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
                )
                
      ),
    
   
     
     body:
     Container(
      color: AppColor.grey,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      
      child: ListView(children: [
        
       
        Icon(Icons.check_circle_outline, size: 200, color: Colors.green,),
       SizedBox(height: 30.0,),

        CustomTextBodyAuth(textbody: "Go To Login and Login With New password "),


     

       SizedBox(height: 150.0,),

 

      

      

    

    
         CustomButtonAuth(   buttonText: "Go To Login ", 
                             onPressed: (){
                              controller.goToLoginPage();
                             },
                             ),
                        

      
     ],),)
    );
  }
}