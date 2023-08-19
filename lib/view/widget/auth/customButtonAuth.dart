import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;

  const CustomButtonAuth({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
     // margin: EdgeInsets.only(top: 25.0),
      child: MaterialButton(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: onPressed, 
       child: Text(buttonText, style: const TextStyle(color: Colors.white),),
       ),
    );

  }
}