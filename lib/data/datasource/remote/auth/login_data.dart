import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class LoginData {

Crud crud;
LoginData(this.crud);

  postdata( String email, String password ) async {  
   var response = await crud.postData(Applink.login,{     // loginWithOTP function

            "email" : email,   
            "password" : password , 
           
   });
      return response.fold((l) => l, (r) => r);
  }
}