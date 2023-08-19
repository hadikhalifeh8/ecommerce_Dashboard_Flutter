import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class VerifyCodeResetPasswordData {

Crud crud;
VerifyCodeResetPasswordData(this.crud);

  postdata( String email, String verifycode) async {  
   var response = await crud.postData(Applink.verifyCodeResetPassword,{     // re-send otp via email

            "email" : email,   
           "verify_code" : verifycode ,   

   });
      return response.fold((l) => l, (r) => r);
  }
}