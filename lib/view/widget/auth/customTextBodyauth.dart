import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textbody;
  const CustomTextBodyAuth({Key? key, required this.textbody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(textbody,  textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black87),
        ),
      );
  }
}