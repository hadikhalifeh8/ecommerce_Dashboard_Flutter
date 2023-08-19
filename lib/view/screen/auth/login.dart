import 'package:ecommerce_dashboard/controller/auth/loginController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/alertexitapp.dart';
import 'package:ecommerce_dashboard/core/functions/validationinput.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextBodyauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customTextTitleAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/logoAuth.dart';
import 'package:ecommerce_dashboard/view/widget/auth/textsignin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      LoginControllerImp  controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
              //  backgroundColor: AppColor.grey,
                elevation: 0,
                centerTitle: true,
                title: Text("Login", style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
                )
                
      ),
    
   
     
     body:
     // Alert Exite App function
       WillPopScope( onWillPop: alertExiteApp, 
      child:  GetBuilder<LoginControllerImp>(builder: (controller) => 

            //             //*******Loading ****** */
      // controller.statusRequest == StatusRequest.loading ?
      // const Center(child: Text("loading ..,"))  :
      // //*******Loading ****** */

     HandlingDataRequest(statusRequest: controller.statusRequest, widget:       Container(
      // color: AppColor.grey,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      
      child: Form(
        key: controller.formstate,
        child: ListView(children: [
          
           LogoAuth(),
           CustomTextTitleAuth(textTitle: "Welcom Back"),
           SizedBox(height: 15.0,),
          CustomTextBodyAuth(textbody: "Sign In With Your E-mail and Password Or \n Continue With Social media"),

     

         SizedBox(height: 30.0,),

         CustomTextFormAuth(
                          hinttext: "Enter Your Email", 
                          labeltext: "Email", 
                          iconData: Icons.email_outlined,

                          mycontroller: controller.email,
                          valid: (value){
                            return valiInput(value!, 6, 100, "email");
                          },
                          keyBoardTypeISNumber:false,
                          
        
         ), 

        

        GetBuilder<LoginControllerImp>(builder: (controller) =>    CustomTextFormAuth(
                              hinttext: "Enter Your password", 
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
                          }
         ),) ,



     InkWell( // hoverColor: Colors.red,
          onTap: (){controller.goToForgetPasswordPage();},
         child: Container(margin:EdgeInsets.all(10.0),
          child: Text("forget password", textAlign: TextAlign.end,)),
     ),

    
           CustomButtonAuth(   buttonText: "Login", 
                               onPressed: (){
                                controller.login();
                               },
                               ),
            const SizedBox(height: 20.0,),
 
    TextSignInORSignUP(textone: "Dont have an account? ",
                         texttwo: " Sign Up", 
                          onTap: (){
                           // controller.goToSignUpPage();
                          },
                          ),                       

        
     ],),
      ),))




      )
      )

    );
  }
}