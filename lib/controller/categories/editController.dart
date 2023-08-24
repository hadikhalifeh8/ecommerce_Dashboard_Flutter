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

class  CategoryEditController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  CategoriesData categoriesData = CategoriesData(Get.find()); // Get.find() كل شي محفون
 
   StatusRequest statusRequest = StatusRequest.none;

   CategoriesModel? categoriesModel;
  

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




  edit(String id) async {
  try{
    if(formState.currentState!.validate()) // for validation
    {
      // ما رح إجبر الشخص يعدل أو يرفع صوره

            //  if(file == null) {
            //    return Get.snackbar("warning", "Please Choose Image SVG");
            //  }
    
   // try{

             // statusRequest = StatusRequest.loading;  
             
      

      // Map datas = {
      //   //  'id':id,

      //   'name_ar' :nameAr.text,
      //   'name_en' :nameAr.text,
      //   //  'image':file
         
      // };



     var response = await categoriesData.editData(id, nameAr.text,nameEn.text,file); //loading هون خلص 


      print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

    update();

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
      print("yess");

      Get.offNamed(AppRoute.viewcategory);

     //to refresh directly when insert data
     
      CategoryViewController controller = Get.find();

      controller.getData();

    //to refresh directly when insert data

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات

      print("noo");
           
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

  categoriesModel = Get.arguments['categoriesModels_']; //Get.arguments['categoriesModels_']  from viewcontroller ==>  goToPageEdit(CategoriesModel categoriesModel)


    nameAr = TextEditingController();
    nameEn = TextEditingController();


    // get data from db view to texts in edit
    nameAr.text = categoriesModel!.nameAr.toString();
    nameEn.text = categoriesModel!.nameEn.toString();


    super.onInit();
  }
}
