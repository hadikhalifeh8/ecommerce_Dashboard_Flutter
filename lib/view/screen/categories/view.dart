import 'package:ecommerce_dashboard/controller/categories/viewController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/constant/imageasset.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/data/model/categoriesmodel.dart';
import 'package:ecommerce_dashboard/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class categoriesView  extends StatelessWidget {
  const categoriesView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    Get.put(CategoryViewController());
  
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),),

      
      floatingActionButton: FloatingActionButton(
                                  onPressed: (){Get.toNamed(AppRoute.addcategory);},
                                  child: const Icon(Icons.add),
         ),


      
      body: GetBuilder<CategoryViewController>(builder: ((controller) =>
       
       HandlingDataView(
                      statusRequest: controller.statusRequest,
       
                    widget:
                    
                     WillPopScope(
                     
                       onWillPop: () { 
                        return controller.back();
                         },


                       child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),

        child: ListView.builder(
          
          itemCount: controller.data.length,
          itemBuilder: (context, index) {

              return Container(height: 80,
                child: Card(child: Row(children: [ 


                  Expanded(flex: 2,
                  child:
                   Container(
                    padding: const EdgeInsets.all(10.0),
                    
                    child: SvgPicture.network('${Applink.imageCategories}/${controller.data[index].image.toString()}'))
                    
                    ),
              

                  Expanded(flex: 3,
                  child: ListTile(
                                  title: Text(controller.data[index].nameEn.toString(),),

                                  //subtitle: Text(controller.data[index].createdAt.toString(),),
                                  
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          
                          children: [
                          IconButton(onPressed: (){

       Get.defaultDialog(title: "Warning", middleText: "Are you shre to Delete",
       
            onCancel: (){}, 
         
           onConfirm: (){
                          controller.deletecategory(controller.data[index].id.toString());
                           
                           Get.back(); //ok عشان تنشال بس إكبس 
                         }
                         
       );
                           
                        }, 
                        icon: const Icon(Icons.delete_forever),), 


  /*********************************** Edit icon  ***************************************************** */

                        IconButton(onPressed: (){
 
                         controller.goToPageEdit(controller.data[index]); //Model بمرر ال 
                         }, 
                       
                        icon: const Icon(Icons.edit),), 
                        ],)         
                  
                  )),
                ],)
                
                
                
                
                
                
                ),
              );
          }
        
        ,),),
                     )) 
      )));
  }
}