import 'package:ecommerce_dashboard/controller/orders/detailsOrder_controller.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/middleware/myMiddleware.dart';
import 'package:ecommerce_dashboard/view/screen/Home/home.dart';
import 'package:ecommerce_dashboard/view/screen/Items/add.dart';
import 'package:ecommerce_dashboard/view/screen/Items/edit.dart';
import 'package:ecommerce_dashboard/view/screen/Items/view.dart';
import 'package:ecommerce_dashboard/view/screen/Test/test.dart';

import 'package:ecommerce_dashboard/view/screen/auth/forgetpassword/checkEmail.dart';
import 'package:ecommerce_dashboard/view/screen/auth/forgetpassword/resetPassword.dart';
import 'package:ecommerce_dashboard/view/screen/auth/forgetpassword/successResetPassword.dart';
import 'package:ecommerce_dashboard/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_dashboard/view/screen/auth/login.dart';
import 'package:ecommerce_dashboard/view/screen/categories/add.dart';
import 'package:ecommerce_dashboard/view/screen/categories/edit.dart';
import 'package:ecommerce_dashboard/view/screen/categories/view.dart';
import 'package:ecommerce_dashboard/view/screen/language.dart';
import 'package:ecommerce_dashboard/view/screen/orders/OrderScreen.dart';
import 'package:ecommerce_dashboard/view/screen/orders/details.dart';
import 'package:ecommerce_dashboard/view/screen/orders/pendingOrders.dart';




import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:path/path.dart';


List<GetPage<dynamic>>? routes = [

   GetPage(name:  "/", page: () => const Language(), middlewares: [MyMidlleware()]),
   // GetPage(name:  "/", page: () => const TestView(),),


// Test
   GetPage(name:  AppRoute.test, page: () => const Test(),),



// onBoarding page
   //GetPage(name:  AppRoute.onBoarding, page: () => const OnBoarding(),),

// Auth
   GetPage(name:  AppRoute.login, page: () => const Login(),),

   //GetPage(name:  AppRoute.signup, page: () => const Signup(),),
  // GetPage(name:  AppRoute.verifyCodeSignup, page: () => const VerifyCodeSignUp(),),

   GetPage(name:  AppRoute.forgetpassword, page: () => const ForgetPassword(),),
   GetPage(name:  AppRoute.verifycode, page: () => const VerifyCode(),),
   GetPage(name:  AppRoute.resetPassword, page: () => const ResetPassword(),),
   GetPage(name:  AppRoute.successRestPassword, page: () => const SuccessRestPassword(),),


   // HomeScreen
   GetPage(name:  AppRoute.homeScreeen, page: () => const HomeScreen(),),



    // Categories
   GetPage(name:  AppRoute.viewcategory, page: () => const categoriesView(),),
   GetPage(name:  AppRoute.addcategory, page: () => const CategoriesAdd(),),
   GetPage(name:  AppRoute.editcategory, page: () => const CategoriesEdit(),),



    // Items / Products
   GetPage(name:  AppRoute.viewitem, page: () => const ItemsView(),),
   GetPage(name:  AppRoute.additem, page: () => const ItemsAdd(),),
   GetPage(name:  AppRoute.edititem, page: () => const ItemsEdit(),),



   // Orders 
   GetPage(name:  AppRoute.screenOrder, page: () => const OrderScreen(),),
   GetPage(name:  AppRoute.detailsOrder, page: () => const OrderDetails(),),








];



