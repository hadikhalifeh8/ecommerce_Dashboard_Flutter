import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class ArchiveOrderData {

  Crud crud;
  ArchiveOrderData(this.crud);

  getData() async {
   var response = await crud.postData(Applink.archiveOrder, {});
      return response.fold((l) => l, (r) => r);
  }





}