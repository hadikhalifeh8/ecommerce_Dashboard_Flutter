import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/auth/Forget%20Password/resetPassword_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{

goToSuccesrestPasswordPage();

}

class ResetPasswordControllerImp extends ResetPasswordController{


   // bs ekbs 3a buton l password byozhar l kalam aw bye5fehon
  bool isPasswordShow = false; // بالبدايه لازم يظهر الكتابه
   showPassword()
   {
   isPasswordShow =  isPasswordShow == true ? false : true;
    update();
   }
 // bs ekbs 3a buton l password byozhar l kalam aw bye5fehon

    GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
    StatusRequest statusRequest = StatusRequest.none;
  String? email;

  late TextEditingController password;
  late TextEditingController repassword;


  @override
  goToSuccesrestPasswordPage() async{
      /*******************password not match************* */
   if(password.text != repassword.text) {
   return Get.defaultDialog(title: "warning", middleText: "password not match");
   }
   /*******************password not match************* */
   
    if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await resetPasswordData.postdata(email!,  password.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.login);
      }
      else{
        Get.defaultDialog(title: "Warning ", middleText: "try again");
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     } 
      update();
    }

  }



  @override
  void onInit() {
   email = Get.arguments['email']; // CheckEmail Page من ال  email بستقبل 

    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
  
  

}