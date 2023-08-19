import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onClick;

  const CardAdminHome({Key? key, required this.image, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
                            onTap: onClick,

                            child: Card(
                          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(image, width: 80.0,),
                             //Lottie.asset(AppImageAsset.avatar, height: 80.0,width: 80.0,),
                               Text(title)
                            ],
                                                ),
                                                  ),
                          );
  }
}