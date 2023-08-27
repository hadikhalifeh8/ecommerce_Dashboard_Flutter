import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class AcceptedOrdersData {

  Crud crud;
  AcceptedOrdersData(this.crud);

  getData() async {
   var response = await crud.postData(Applink.viewAcceptedOrders, {});
      return response.fold((l) => l, (r) => r);
  }



  prepared(String orderid, String userid, String ordertype) async {
   var response = await crud.postData('${Applink.prepareOrder}/$orderid/$userid', {
    'orderid': orderid,
    'userid': userid,
    'order_type': ordertype,

   });
      return response.fold((l) => l, (r) => r);
  }


}