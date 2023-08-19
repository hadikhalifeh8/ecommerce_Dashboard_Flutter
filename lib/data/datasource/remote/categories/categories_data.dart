import 'dart:io';

import 'package:ecommerce_dashboard/core/class/crud.dart';
import 'package:ecommerce_dashboard/linkapi.dart';

class CategoriesData {

Crud crud;
CategoriesData(this.crud);

getData() async {

var response = await crud.postData(Applink.viewCategory, {});
return response.fold((l) => l, (r) => r);
}


//add(Map data, File file) async {

add(String namear, String nameen, File file) async {
var response = await crud.addRequestWithImageOne(Applink.addCategory, {"name_ar":namear,"name_en":nameen},file);
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */
// إذا عدلت عالصوره {!= null} ==> use addRequestWithImageOne(data, file)

// أو تركتا متل ما هيي ما عدلت عليها للصوره{==  null} ==> use postData(data)

editData(String category_id,String namear, String nameen, [File? file]) async {

  var response; 
  if(file == null){
    response = await crud.postData('${Applink.editCategory}/$category_id', {"name_ar":namear,"name_en":nameen});
      
  } else{
    response = await crud.addRequestWithImageOne('${Applink.editCategory}/$category_id', {"name_ar":namear,"name_en":nameen}, file);
      
  }

return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */



deleteData(String category_id) async {

var response = await crud.postData('${Applink.deleteCategory}/$category_id', {"category_id":category_id});
return response.fold((l) => l, (r) => r);
}


}