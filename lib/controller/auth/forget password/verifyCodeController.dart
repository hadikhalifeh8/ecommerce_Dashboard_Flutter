import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/auth/Forget%20Password/verifycode_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{

goToResetPasswordPage(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  VerifyCodeResetPasswordData verifyCodeResetPasswordData = VerifyCodeResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

 
//  late String verifycode;
 String? email; //forgetpasswordController ببعتو من صفحة ال  
 
  @override
  goToResetPasswordPage(verifycode) async{

                      statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
                update();

     var response = await verifyCodeResetPasswordData.postdata(email!, verifycode); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       Get.offNamed(AppRoute.resetPassword, arguments:{
                     "email": email
        });
      }
      else{
       Get.defaultDialog(title: "Warning ", middleText: "Verify Code Not Correct");
         statusRequest = StatusRequest.failure; 
      }
     } 
      update();
  
  }

  @override
  void onInit() {
    email = Get.arguments["email"]; // CheckEmail Page من ال  email بستقبل 
    super.onInit();
  }

}