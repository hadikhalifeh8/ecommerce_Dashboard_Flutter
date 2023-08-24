import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_dashboard/controller/items/addController.dart';
import 'package:ecommerce_dashboard/core/class/handlingDataView.dart';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';

import 'package:ecommerce_dashboard/core/functions/validationinput.dart';
import 'package:ecommerce_dashboard/core/shared/customDropDownSearch.dart';
import 'package:ecommerce_dashboard/core/shared/customTextFormGlobal.dart';
import 'package:ecommerce_dashboard/view/widget/auth/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemAddController controler = Get.put(ItemAddController());


    return Scaffold(appBar: AppBar(centerTitle: true, title: const Text("Add Item"),),

    body: GetBuilder<ItemAddController>(builder: (controller) => 

    
       HandlingDataView(
                         statusRequest: controler.statusRequest, 
           widget:  Container(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0) ,child:
    
     Form(
      key: controller.formState,
       child: ListView(children: [
               CustomTextFormGlobal( 
                              hinttext: "insert Item in Arabic", 
                              labeltext: "Item name AR", 
                              iconData: Icons.keyboard_option_key, 
                              mycontroller: controler.nameAr, 
                              
                              valid: (val)  {
                               return valiInput(val!, 1, 30, "");
                                },

                              keyBoardTypeISNumber: false,
       ),

              CustomTextFormGlobal( 
                              hinttext: "insert Item in English", 
                              labeltext: "Item name EN", 
                              iconData: Icons.category, 
                              mycontroller: controler.nameEn, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 30, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),

        CustomTextFormGlobal( 
                              hinttext: "insert Item Description in English", 
                              labeltext: "item description EN", 
                              iconData: Icons.category, 
                              mycontroller: controler.descriptionEn,
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 300, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),


        CustomTextFormGlobal( 
                              hinttext: "insert Item Description in Arabic", 
                              labeltext: "item description Ar", 
                              iconData: Icons.category, 
                              mycontroller: controler.descriptionAr, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 300, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),


         CustomTextFormGlobal( 
                              hinttext: "insert Item count", 
                              labeltext: "item count", 
                              iconData: Icons.category, 
                              mycontroller: controler.count, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 30, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),


         CustomTextFormGlobal( 
                              hinttext: "insert Item price", 
                              labeltext: "item price", 
                              iconData: Icons.category, 
                              mycontroller: controler.price, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 30, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),

            CustomTextFormGlobal( 
                              hinttext: "insert Item discount", 
                              labeltext: "item discount", 
                              iconData: Icons.category, 
                              mycontroller: controler.discount, 
                              
                              valid: (val)  {
                              return  valiInput(val!, 1, 30, "");
                                
                                },

                              keyBoardTypeISNumber: false,
       ),

       CustomDropDownSearch(
        title: "choose category",
       
        listdata: controler.dropdownList,
        // [
        //   SelectedListItem(name: "a", value: "1"),
        //   SelectedListItem(name: "b", value: "2"),
        // ],
         
          dropDownSelectedName: controller.categoryname_!, 
          dropDownSelectedID: controller.categoryid_!
        ),


       Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal:80.0),
        
         child: MaterialButton(onPressed: (){

            // fileUploadGallery(); // true or false  ==>by default false

           // controler.chooseImage();

           controler.showOptionImage();

         },
          child:   Text("Choose Image",style: TextStyle(color: Colors.white),),color: AppColor.secoundColor,
   
          ),
       ),




  

///////// drop down list

//  TextFormField(
//           controller: controller.dropDownName,
//           cursorColor: Colors.black,
//           onTap: 
//                () {
//                   FocusScope.of(context).unfocus();
//                   // onTextFieldTap();
//                   controler.showDropDownList(context);
//                 },
               
//           decoration: const InputDecoration(
//             filled: true,
//             fillColor: Colors.black12,
//             contentPadding:
//                 EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
//             hintText: "choose category",
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//           ),
//         ),





// if choose an image then show this image in ui
       if(controller.file != null)
       
        // SvgPicture.file(controler.file!),
         Image.file(controler.file!, height: 100.0,width: 100.0,),

      




       CustomButtonAuth(buttonText: "Add", onPressed: (){controler.addData();})


       ],),
     ),),)
     )
    
    );
  
     
     
    
   
   



// zlnc9156
     

    
  }
}