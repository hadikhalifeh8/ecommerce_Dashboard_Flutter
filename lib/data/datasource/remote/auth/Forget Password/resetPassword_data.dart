import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class ResetPasswordData {

Crud crud;
ResetPasswordData(this.crud);

  postdata( String email, String password) async {  
   var response = await crud.postData(Applink.resetPassword,{     // re-send otp via email

            "email" : email,   
            "password" : password,   

   });
      return response.fold((l) => l, (r) => r);
  }
}