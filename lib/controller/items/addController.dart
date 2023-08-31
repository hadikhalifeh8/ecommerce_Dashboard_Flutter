import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class  ItemAddController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  ItemsData itemsData = ItemsData(Get.find()); // Get.find() كل شي محفون


// DropDownList خصها بال List
  List<SelectedListItem> dropdownList = [];


   StatusRequest statusRequest = StatusRequest.none;
  

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




  addData() async {
  try{
    if(formState.currentState!.validate()) // for validation
    {
             if(file == null) {
               return Get.snackbar("warning", "Please Choose Image ");
             }
    
   // try{

             // statusRequest = StatusRequest.loading;  

      Map data = {
        'category_id' :categoryid_!.text,

        'name_ar' :nameAr.text,
        'name_en' :nameEn.text,
        'description_ar' :descriptionAr.text,
        'description_en' :descriptionEn.text,
        'count' :count.text,
        'price' :price.text.toString(),
        'created_at' :DateTime.now().toString(),


        //type 'int' is not a subtype of type 'double?
        // in model ma7al l int or double b7ot num
             // 'price' :double.parse(price.text), 


        'discount' :discount.text,


        
      };



     var response = await itemsData.add(data, file!); //loading هون خلص 

      print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

    update();

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
      Get.offNamed(AppRoute.viewitem);
      

     //to refresh directly when insert data
     
      ItemViewController controller = Get.find();

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
                                            name: data[i].nameEn.toString(),
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

    getCategoryData(); //items بتشتغل أؤل ما إفتح صفحه ال 

    dropDownName= TextEditingController();
    dropDownId = TextEditingController();


    nameAr = TextEditingController();
    nameEn = TextEditingController();

    descriptionAr = TextEditingController();
    descriptionEn = TextEditingController();

    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();

    categoryname_ = TextEditingController();
    categoryid_ = TextEditingController();



    super.onInit();
  }




//   showDropDownList(context)
//   {
//     DropDownState(
//       DropDown(
//         bottomSheetTitle: const Text(
//           "title",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         submitButtonChild: const Text(
//           'Done',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         data:[SelectedListItem(name: "a"), SelectedListItem(name: "b")],
//         selectedItems: (List<dynamic> selectedList) {

 
//  //choose category القيمه اللي بختارها لازم تظهر برا بدال 
//           SelectedListItem selectedListItem =selectedList[0];
//           dropDownName.text = selectedListItem.name;
          

//           // List<String> list = [];
//           // for(var item in selectedList) {
//           //   if(item is SelectedListItem) {
//           //     list.add(item.name);
//           //   }
//           // }

//         //  showSnackBar(list.toString());
//         },
//      //   enableMultipleSelection: true,
//       ),
//     ).showModal(context);

    
//   }
}
