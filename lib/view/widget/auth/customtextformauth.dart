import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool keyBoardTypeISNumber;
  final bool?  obscureText; //password text عشان بس بحتاجو جوات 
  final void Function()? onTapIcon;


    CustomTextFormAuth({Key? key, 
    required this.hinttext, 
    required this.labeltext, 
    required this.iconData, 
    required this.mycontroller, 
    required this.valid, 
    required this.keyBoardTypeISNumber, 
    this.obscureText, //password text عشان بس بحتاجو جوات 
    this.onTapIcon,
    

    
    
    }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: TextFormField(
          validator: valid,
          controller: mycontroller,
          keyboardType: keyBoardTypeISNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text ,
           
          // secure the text *****
          obscureText: obscureText == null || obscureText == false ? false : true,
          
          
          
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always ,
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
        
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),

              label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)
                ),
              suffixIcon: InkWell(onTap: onTapIcon, 
                                  child: Icon(iconData),
              ),
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 14.0)
              
              ),
        ),
      );
  }
}