import 'package:ecommerce_dashboard/core/constant/Colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {

final void Function()? onPressed;
final String textButton ;
final IconData iconData;
//final Color coloritemselected;
bool activeColor;

   CustomButtonAppBar({Key? key,
                                    required this.textButton, 
                                    required this.iconData, 
                                    required this.onPressed, 
                                    //required this.coloritemselected,
                                    required this.activeColor,
                                    
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
        
        // onPressed: (){
        //   // controller.changePage(0);
        //   // onPressed;
        // },
         child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData,  color: activeColor == true ? AppColor.primaryColor : Colors.black,),
            Text(textButton,style: TextStyle(color: activeColor == true ? AppColor.primaryColor : Colors.black,), ),
          ],
        ),
        );
  }
}