import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';
class OrdersPendingData {

  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
   var response = await crud.postData(Applink.viewpendingOrders, {});
      return response.fold((l) => l, (r) => r);
  }


  approvedOrders(String orderid,String userid) async {
   var response = await crud.postData('${Applink.approveOrder}/$orderid/$userid', {});
      return response.fold((l) => l, (r) => r);
  }


}