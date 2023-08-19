import 'package:flutter/material.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';

ThemeData themeEnglish = ThemeData(
  
  //ِApp على مستوى كل ال 
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor,),
  appBarTheme: const AppBarTheme(

                 
                  centerTitle: true,
                  elevation: 0.0,
                   iconTheme: IconThemeData(color: Colors.white),
                   
                   titleTextStyle: TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0
                   ),

        backgroundColor: AppColor.primaryColor,
  
  
  
  ), 
      //ِApp على مستوى كل ال 

        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headline1:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0,
                             color: AppColor.black),
          headline2:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26.0,
                             color: AppColor.black),
          bodyText1:  TextStyle(
                              height: 2,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),

        bodyText2:  TextStyle(
                              height: 2,
                              color: AppColor.grey,
                              fontSize: 14.0),

        ),
        primarySwatch: Colors.blue,
      );


      ThemeData themeArabic = ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
          headline1:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0,
                             color: AppColor.black),
          headline2:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26.0,
                             color: AppColor.black),
          bodyText1:  TextStyle(
                              height: 2,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),

        bodyText2:  TextStyle(
                              height: 2,
                              color: AppColor.grey,
                              fontSize: 14.0),

        ),
        primarySwatch: Colors.blue,
      );