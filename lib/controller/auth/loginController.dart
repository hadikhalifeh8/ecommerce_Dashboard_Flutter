import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/core/services/services.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {

  goToForgetPasswordPage();
  login();
  goToSignUpPage();
}
class LoginControllerImp extends LoginController { 
 


Myservices myservices = Get.find();

  LoginData loginData = LoginData(Get.find());
   StatusRequest statusRequest = StatusRequest.none;
 
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

 // bs ekbs 3a buton l password byozhar l kalam aw bye5fehon
  bool isPasswordShow = false; // بالبدايه لازم يظهر الكتابه
   showPassword()
   {
   isPasswordShow =  isPasswordShow == true ? false : true;
    update();
   }
 // bs ekbs 3a buton l password byozhar l kalam aw bye5fehon



  @override
  goToForgetPasswordPage() {
    Get.offNamed(AppRoute.forgetpassword);
   
  }

  @override
  goToSignUpPage() {
    Get.offNamed(AppRoute.signup);
   
  }

  @override
  login() async{
       if(formstate.currentState!.validate())
    {
       statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
       update();
     var response = await loginData.postdata( email.text,  password.text); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
        // data.addAll(response['data']);

      // if not approve the account     
       if(response['data']['admin_approve'] == "1")
       {
        myservices.sharedPreferences.setString("id", response['data']['id'].toString());
       myservices.sharedPreferences.setString("name", response['data']['name'].toString());
       myservices.sharedPreferences.setString("email", response['data']['email'].toString());
       myservices.sharedPreferences.setString("phone", response['data']['phone_no'].toString());

       myservices.sharedPreferences.setString("step", "2");

       Get.offNamed(AppRoute.homeScreeen);
       }  else{
             Get.toNamed(AppRoute.verifyCodeSignup, arguments: { "email": email.text});
       }
     
      }
      else{
        Get.defaultDialog(title: "Warning ", middleText: "Email or Password  not correct");
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      } 
     } 
      update(); 
    }
  }

  @override
  void onInit() {

  FirebaseMessaging.instance.getToken().then((value) 
  {
    print("the token id for firebase is: $value");
    String? token = value;
  });

    email = TextEditingController();
    password = TextEditingController();
    
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}