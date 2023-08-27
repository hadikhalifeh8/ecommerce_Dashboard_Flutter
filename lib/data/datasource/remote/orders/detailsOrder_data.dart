import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';
class OrderDetailsData {

  Crud crud;
  OrderDetailsData(this.crud);

  getData(String orderid) async {
   var response = await crud.postData("${Applink.detailsOrder}/$orderid", {});
      return response.fold((l) => l, (r) => r);
  }

}