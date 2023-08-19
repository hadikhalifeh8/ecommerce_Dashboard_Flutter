import 'package:ecommerce_dashboard/controller/auth/forget%20password/forgetPasswordController.dart';
import 'package:ecommerce_dashboard/controller/auth/forget%20password/verifyCodeController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';

import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextBodyauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/textsignin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
                backgroundColor: AppColor.grey,
                elevation: 0,
                centerTitle: true,
                title: Text("Verification Code", style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
                )
                
      ),
    
   
     
     body: GetBuilder<VerifyCodeControllerImp>(builder: (controller) =>  

           HandlingDataRequest(statusRequest: controller.statusRequest, widget: 
     
         Container(
      color: AppColor.grey,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      
      child: ListView(children: [
        
       
         CustomTextTitleAuth(textTitle: "Check Code"),
         SizedBox(height: 15.0,),
        CustomTextBodyAuth(textbody: "Please Enter The Digit Code Sent To ${controller.email}"),

     

       SizedBox(height: 30.0,),

                 OtpTextField(
            borderRadius: BorderRadius.circular(20.0),
           enabledBorderColor: Colors.blue,
            
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
          controller.goToResetPasswordPage(verificationCode);
          
        }, // end onSubmit
    ),

      
     
      SizedBox(height: 20.0,),
            
    

                        

      
     ],),))
     )
    );
  }
}