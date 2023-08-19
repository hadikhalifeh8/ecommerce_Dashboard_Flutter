import 'dart:io';

import 'package:ecommerce_dashboard/controller/categories/viewController.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/core/functions/uploadFile.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_dashboard/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class  CategoryAddController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  CategoriesData categoriesData = CategoriesData(Get.find()); // Get.find() كل شي محفون
 
   StatusRequest statusRequest = StatusRequest.none;
  

   GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController nameAr;
  late TextEditingController nameEn;

   File? file;


   // from lib/core/functions
   chooseImage() async
   {
      file = await fileUploadGallery(true);
      update(); // refresh ui
   }




  addData() async {
  try{
    if(formState.currentState!.validate()) // for validation
    {
             if(file == null) {
               return Get.snackbar("warning", "Please Choose Image SVG");
             }
    
   // try{

             // statusRequest = StatusRequest.loading;  

      // Map data = {

      //   'name_ar' :nameAr.text,
      //   'name_en' :nameEn.text,
         
      // };



     var response = await categoriesData.add(nameAr.text, nameEn.text,file!); //loading هون خلص 

      print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

    update();

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
      Get.offNamed(AppRoute.viewcategory);

     //to refresh directly when insert data
     
      CategoryViewController controller = Get.find();

      controller.getData();

    //to refresh directly when insert data

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات

           
      }
     }
     
      update(); // Refresh 
    }
  }
  
catch(_){
    // statusRequest = StatusRequest.serverException;
  }


   }



   @override
  void onInit() {
    nameAr = TextEditingController();
    nameEn = TextEditingController();

    super.onInit();
  }
}
