import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/categories/categories_data.dart';
import 'package:ecommerce_dashboard/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class  CategoryViewController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  CategoriesData categoriesData = CategoriesData(Get.find()); // Get.find() كل شي محفون
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;


     getData() async {

      data.clear(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)

     update(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 



     var response = await categoriesData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
       //  data.addAll(response['data']);
       List datalist = response['data'];
       data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



  deletecategory(String id)async
  {
    
     var response = await categoriesData.deleteData(id); //loading هون خلص // delete from db 

        print("***************##############************* Controler $response ");


     data.removeWhere((element) =>  element.id.toString() == id.toString()); // delete from ui
     update();
  }

  //************************************************************************************ */

  goToPageEdit(CategoriesModel categoriesModel)
  {
    Get.toNamed(AppRoute.editcategory, 
                           arguments: {
                            "categoriesModels_" : categoriesModel
                           });

     // "categoriesModel" from editcontroller : categoriesModel  from funcion   goToPageEdit(CategoriesModel categoriesModel)  
  }

  //************************************************************************************ */





   @override
  void onInit() {
    getData();
    super.onInit();
  }


// arrow back
  back()
  {
    Get.offAllNamed(AppRoute.homeScreeen);
    return Future.value(false);

  }
}