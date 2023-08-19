import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String textTitle;
  const CustomTextTitleAuth({Key? key, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(textTitle,  textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
      
      );
      
  }
}