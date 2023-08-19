import 'package:ecommerce_dashboard/controller/categories/addController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';

import 'package:ecommerce_dashboard/core/functions/validationinput.dart';
import 'package:ecommerce_dashboard/core/shared/customTextFormGlobal.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryAddController controler = Get.put(CategoryAddController());


    return Scaffold(appBar: AppBar(centerTitle: true, title: const Text("Add Category"),),

    body: GetBuilder<CategoryAddController>(builder: (controller) => 

    
       HandlingDataView(
                         statusRequest: controler.statusRequest, 
           widget:  Container(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0) ,child:
    
     Form(
      key: controller.formState,
       child: ListView(children: [
               CustomTextFormGlobal( 
                              hinttext: "insert category in Arabic", 
                              labeltext: "category name AR", 
                              iconData: Icons.category, 
                              mycontroller: controler.nameAr, 
                              
                              valid: (val)  {
                               return valiInput(val!, 1, 30, "");
                                },

                              keyBoardTypeISNumber: false,
       ),

              CustomTextFormGlobal( 
                              hinttext: "insert category in English", 
                              labeltext: "category name EN", 
                              iconData: Icons.category, 
                              mycontroller: controler.nameEn, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 30, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),


       Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal:80.0),
        
         child: MaterialButton(onPressed: (){

            // fileUploadGallery(); // true or false  ==>by default false

           controler.chooseImage();
         },
          child:   Text("Choose Image",style: TextStyle(color: Colors.white),),color: AppColor.secoundColor,
   
          ),
       ),

// if choose an image then show this image in ui
       if(controller.file != null)
        SvgPicture.file(controler.file!),




       CustomButtonAuth(buttonText: "Add", onPressed: (){controler.addData();})


       ],),
     ),),)
     )
    
    );
  
     
     
    
   
   



// zlnc9156
     

    
  }
}