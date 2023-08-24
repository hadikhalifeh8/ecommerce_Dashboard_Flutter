import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_dashboard/controller/categories/viewController.dart';
import 'package:ecommerce_dashboard/controller/items/viewController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:ecommerce_dashboard/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemsView  extends StatelessWidget {
  const ItemsView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    Get.put(ItemViewController());
  
    return Scaffold(
      appBar: AppBar(title: const Text("Items"),),

      
      floatingActionButton: FloatingActionButton(
                                  onPressed: (){Get.toNamed(AppRoute.additem);},
                                  child: const Icon(Icons.add),
         ),


      
      body: GetBuilder<ItemViewController>(builder: ((controller) =>
       
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

                child: InkWell(// for edit
                  onTap: (){
                         controller.goToPageEdit(controller.data[index]); //Model بمرر ال 

                  },

                  child: Card(child: Row(children: [ 
                
                
                    Expanded(flex: 2,
                    child:
                     Container(
                      padding: const EdgeInsets.all(10.0),
                      
                      child: CachedNetworkImage(imageUrl: '${Applink.imageItems}/${controller.data[index].image.toString()}'
                      )
                      ),
                    ),
                      
                                 
                
                    Expanded(flex: 3,
                    child: ListTile(
                                    title: Text(controller.data[index].nameEn.toString(),),
                                    subtitle: Text(controller.data[index].categoryRltn!.nameEn.toString(),),
                
                
                                    //subtitle: Text(controller.data[index].createdAt.toString(),),
                                    
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            
                            children: [
                            IconButton(onPressed: (){
                
                       Get.defaultDialog(title: "Warning", middleText: "Are you shre to Delete",
                       
                            onCancel: (){}, 
                         
                           onConfirm: (){
                            controller.deleteItem(controller.data[index].id.toString());
                             
                             Get.back(); //ok عشان تنشال بس إكبس 
                           }
                           
                       );
                             
                          }, 
                          icon: const Icon(Icons.delete_forever, color: Colors.red,),), 
                
                
                  /*********************************** Edit icon  ***************************************************** */
                
                          // IconButton(onPressed: (){
                 
                          //  controller.goToPageEdit(controller.data[index]); //Model بمرر ال 
                          //  }, 
                         
                          // icon: const Icon(Icons.edit, color: Colors.blue),
                          // ),
                
                          ],
                          )         
                    
                    )),
                  ],)
                  
                  
                  
                  
                  
                  
                  ),
                ),
              );
          }
        
        ,),),
                     )) 
      )));
  }
}