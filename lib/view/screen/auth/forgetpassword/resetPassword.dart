import 'package:ecommerce_dashboard/controller/auth/forget%20password/forgetPasswordController.dart';
import 'package:ecommerce_dashboard/controller/auth/forget%20password/resetPasswordController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:ecommerce_dashboard/core/functions/validationinput.dart';

import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextBodyauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/textsignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
                backgroundColor: AppColor.grey,
                elevation: 0,
                centerTitle: true,
                title: Text("Reset Password", style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
                )
                
      ),
    
   
     
     body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) =>    

        HandlingDataRequest(statusRequest: controller.statusRequest, widget: 
     
       Container(
      color: AppColor.grey,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      
      child: Form(
        key: controller.formstate,
        child: ListView(children: [
          
         
        const CustomTextTitleAuth(textTitle: "New password"),
        const SizedBox(height: 15.0,),
        const CustomTextBodyAuth(textbody: "Please Enter New Password"),
      
           
      
        const SizedBox(height: 15.0,),
      
         CustomTextFormAuth(
                          hinttext: "Enter Your Password", 
                          labeltext: "password", 
                          iconData: Icons.lock_outline,
      
                          mycontroller: controller.password,
                          valid: (value){
                              return valiInput(value!, 6, 50, "password");      
                          },
                          keyBoardTypeISNumber:false,
                            
                            obscureText: controller.isPasswordShow,
                             onTapIcon: (){
                              controller.showPassword();
                            },
      
      
        
         ), 
      
           CustomTextFormAuth(
                          hinttext: "Re- Enter Your Password", 
                          labeltext: "password", 
                          iconData: Icons.lock_outline,
      
                          mycontroller: controller.repassword,
                          valid: (value){
                              return valiInput(value!, 6, 50, "password");      
                          },
                          keyBoardTypeISNumber:false,
                            
                            obscureText: controller.isPasswordShow,
                            onTapIcon: (){
                              controller.showPassword();
                            },
      
      
        
         ), 
      
        
      
        
      
          
      
          
           CustomButtonAuth(   buttonText: "Save", 
                               onPressed: (){
                                controller.goToSuccesrestPasswordPage();
                               },
                               ),
                          
      
        
           ],),
      ),))
     )
    );
  }
}