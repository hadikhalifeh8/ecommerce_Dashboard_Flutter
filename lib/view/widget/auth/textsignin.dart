import 'package:ecommerce_dashboard/core/constant/routes.dart';
import 'package:flutter/material.dart';

class TextSignInORSignUP extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const TextSignInORSignUP({Key? key, required this.textone, required this.texttwo, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
      
      Text(textone),
      InkWell(onTap: onTap,
      
        
        child: Text(texttwo, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))
      ],) ;
  }
}