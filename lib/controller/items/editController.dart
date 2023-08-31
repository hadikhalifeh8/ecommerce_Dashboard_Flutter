import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_dashboard/controller/categories/viewController.dart';
import 'package:ecommerce_dashboard/controller/items/viewController.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/core/functions/uploadFile.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/Items/items_data.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_dashboard/data/model/categoriesmodel.dart';
import 'package:ecommerce_dashboard/data/model/itemsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class  ItemEditController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  ItemsData itemsData = ItemsData(Get.find()); // Get.find() كل شي محفون
  

  // DropDownList خصها بال List
  List<SelectedListItem> dropdownList = [];

  
   StatusRequest statusRequest = StatusRequest.none;

   ItemsModel? itemsModel;

   String? active ;

   
   
   isActive(String val)
   {
     active = val;
     update();
   }



  

   GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;

  late TextEditingController nameAr;
  late TextEditingController nameEn;

  late TextEditingController descriptionAr;
  late TextEditingController descriptionEn;

  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;


   TextEditingController? categoryname_;
   TextEditingController? categoryid_;

    File? file;


 showOptionImage()
{
  showbuttommenue(chooseImageCamera, chooseImageGallery);
}

   // from lib/core/functions
   chooseImageCamera() async
   {
      file = await imageUploadCamera();
      update(); // refresh ui
   }

  

   // from lib/core/functions
   chooseImageGallery() async
   {
      file = await fileUploadGallery(false);
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
             
      

      Map data = {
        'category_id' :categoryid_!.text,

        'name_ar' :nameAr.text.toString(),
        'name_en' :nameEn.text.toString(),

        'description_ar' :descriptionAr.text.toString(),
        'description_en' :descriptionEn.text.toString(),

        'count' :count.text.toString(),
         'active' :active.toString(),
        'price' :price.text.toString(),
        'discount' :discount.text.toString(),

       //  'itempricediscount' => calculate in php only

     

        // 'favorite': "0",
        // 'cart_qty' : "0",
       // 'created_at' :DateTime.now().toString(),


        //type 'int' is not a subtype of type 'double?
        // in model ma7al l int or double b7ot num
             // 'price' :double.parse(price.text), 


        


        
      };



     var response = await itemsData.editData(id,data,file); //loading هون خلص 


      print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

    update();

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
      print("yess");

      Get.offNamed(AppRoute.viewitem);

     //to refresh directly when insert data
     
      ItemViewController controller = Get.find();

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





      // get data from category table to drop down list

    getCategoryData() async {

        CategoriesData categoriesData = CategoriesData(Get.find()); // Get.find() كل شي محفون
  
       

      //data.clear(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)

     update(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 



     var response = await categoriesData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         List<CategoriesModel> data = [];
         
       
       List datalist = response['data'];
       data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

 update();
       for(int i = 0; i < data.length; i++)
       {
          dropdownList.add(SelectedListItem(
                                            name: data[i].nameEn!.toString(),
                                            value: data[i].id.toString(),
                                            )  
                                            );
       }
      

      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



   @override
  void onInit() {
    getCategoryData();  // data أو ما بتظهر  items بتشتغل أؤل ما إفتح صفحه ال 

  itemsModel = Get.arguments['itemsModels_']; //Get.arguments['itemsModels_']  from viewcontroller ==>  goToPageEdit(CategoriesModel categoriesModel)


    nameAr = TextEditingController();
    nameEn = TextEditingController();
    descriptionAr = TextEditingController();
    descriptionEn = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    categoryname_ = TextEditingController();
    categoryid_= TextEditingController();






    // get data from db view to texts in edit
    nameAr.text = itemsModel!.nameAr.toString();
    nameEn.text = itemsModel!.nameEn.toString();
    descriptionAr.text = itemsModel!.descriptionAr.toString();
    descriptionEn.text = itemsModel!.descriptionEn.toString();
    count.text = itemsModel!.count.toString();
    price.text = itemsModel!.price.toString();
    discount.text = itemsModel!.discount.toString();
    categoryname_!.text = itemsModel!.categoryRltn!.nameEn.toString();
    categoryid_!.text = itemsModel!.categoryRltn!.id.toString();

    active = itemsModel!.active.toString();




    super.onInit();
  }
}
