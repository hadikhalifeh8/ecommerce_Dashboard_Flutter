import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/core/class/statusRequest.dart';
import 'package:ecommerce_dashboard/core/functions/handlingDataController.dart';
import 'package:ecommerce_dashboard/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class  TestController extends GetxController{
//1- Crud crud  = Crud(); // 2- بحط initial Binding (main / binding folder )

  TestData testData = TestData(Get.find()); // Get.find() كل شي محفون
  List data = [];
  late StatusRequest statusRequest;


     getData() async {
    
     statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)
     var response = await testData.getData(); //loading هون خلص 

     print("***************##############************* Controler $response ");
     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest)
     {
      if(response['status'] == "success")
      {
         data.addAll(response['data']);
      }
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
     }
     
      update(); // Refresh 
   }



   @override
  void onInit() {
    getData();
    super.onInit();
  }
}