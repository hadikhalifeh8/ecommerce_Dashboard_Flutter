import 'dart:io';
import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



imageUploadCamera() async
{
   final PickedFile? file = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 90 );

       // إذا الشخص إختار صوره
    if(file !=null) { 
      return File(file.path); // return path
    }else{
      return null;
    }
}



// Itemsالمتغير عشان بس بدي استعملها بصفحة ال 

fileUploadGallery([isSvg = false]) async
 {
   FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    
    allowedExtensions: isSvg ? [ "svg", "SVG", ] // isSvg = true
                             : [ "png", "PNG","jpg","JPG","jpeg","gif",], // isSvg = false {this is by default}
      );

    // إذا الشخص إختار ملف
    if(result !=null) { 
      return File(result.files.single.path!); // return path
    }else{
      return null;
    }
}


showbuttommenue(imageUploadCamera, fileUploadGallery)
{ 
  Get.bottomSheet(
 //   Directionality(
            //  textDirection: TextDirection.rtl, 
    //  child:
       Container(
        color: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      height: 200,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children: <Widget>[
                Container(child: const Text("choose Image", style: TextStyle(fontSize: 22.0, 
                                     color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
                ),

               const  Padding(padding: EdgeInsets.only(top:10.0)),

    ListTile(onTap: (){
                               
                                 imageUploadCamera(); 
                                    Get.back();
                                    },

              leading: const Icon(Icons.camera_alt),
              title: const Text("image from camera", style: TextStyle(fontSize: 22.0)),
              
    ), 
               

    ListTile(onTap: (){
                               
                                 fileUploadGallery(); 
                                    Get.back();
                                    },

              leading: const Icon(Icons.image),
              title: const Text("image from gallery", style: TextStyle(fontSize: 22.0)),
              
    ), 



              ],),   

      ),
     // )
  );
}