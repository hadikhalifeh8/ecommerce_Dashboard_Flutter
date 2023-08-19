import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class ItemsData {

Crud crud;
ItemsData(this.crud);

getData() async {

var response = await crud.postData(Applink.viewItem, {});
return response.fold((l) => l, (r) => r);
}


addData(Map data) async {

var response = await crud.postData(Applink.addItem, {});
return response.fold((l) => l, (r) => r);
}


editData(Map data) async {

var response = await crud.postData(Applink.editItem, {});
return response.fold((l) => l, (r) => r);
}


deleteData(Map data) async {

var response = await crud.postData(Applink.deleteItem, {});
return response.fold((l) => l, (r) => r);
}


}