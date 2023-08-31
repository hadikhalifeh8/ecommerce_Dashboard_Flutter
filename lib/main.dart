import 'package:ecommerce_dashboard/bindings/initialBinding.dart';
import 'package:ecommerce_dashboard/core/localization/changelocal.dart';
import 'package:ecommerce_dashboard/core/localization/translation.dart';
import 'package:ecommerce_dashboard/core/services/services.dart';
import 'package:ecommerce_dashboard/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await initialServices();
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    LocalController controller =  Get.put(LocalController());


    return GetMaterialApp(


          translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
     // home: const Language(),route   بعملها بال  middleware عشان إستخدم ال 
      //const Test(),
     //  initialBinding: MyBinding(),
       initialBinding: InitialBinding(),
    //  routes: routes,
      getPages: routes,
    );
  }
}


