import 'dart:io';

import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class ItemsData {

Crud crud;
ItemsData(this.crud);

getData() async {

var response = await crud.postData(Applink.viewItem, {});
return response.fold((l) => l, (r) => r);
}


//add(Map data, File file) async {

add(Map data, File file) async {
var response = await crud.addRequestWithImageOne(Applink.addItem, data,file);
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */
// إذا عدلت عالصوره {!= null} ==> use addRequestWithImageOne(data, file)

// أو تركتا متل ما هيي ما عدلت عليها للصوره{==  null} ==> use postData(data)

//editData(String item_id,String category_id, String namear, String nameen, String descar, String descen, String count, String price, String discount, [File? file]) async {
editData(String item_id, Map data, [File? file]) async {
  var response; 
  if(file == null){
    response = await crud.postData('${Applink.editItem}/$item_id',data
);
      
  } else{
    response = await crud.addRequestWithImageOne('${Applink.editItem}/$item_id', data, file);
      
  }

return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */



deleteData(String item_id) async {

var response = await crud.postData('${Applink.deleteItem}/$item_id', {});
return response.fold((l) => l, (r) => r);
}


}