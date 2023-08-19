import 'package:ecommerce_dashboard/core/class/statusRequest.dart';

handlingData(response){
  
  if(response is StatusRequest){
    return response; // fail / serverfailer ...
  }else {
    return StatusRequest.success; // return map (data) success
  }
}