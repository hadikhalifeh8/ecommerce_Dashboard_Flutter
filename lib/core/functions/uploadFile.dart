import 'dart:io';
import 'package:file_picker/file_picker.dart';
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