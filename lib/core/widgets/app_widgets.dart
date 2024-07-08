import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../config/resources/app_colors.dart';
import '../config/resources/app_styles.dart';


Widget buildTextFialdWithLabel({required String label,required String hint,
  required TextInputType textInputType,required TextEditingController controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(label,style: LabelTextFieldTextStyle,),
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField( 
        controller:controller,
        decoration: InputDecoration(
          fillColor: primary,
          filled: true,
          hintText: hint,
          hintStyle: TextFieldTextStyle,
          suffix: label=='Password'?Icon(Icons.visibility_off_rounded,color: Colors.grey[300],):null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        keyboardType: textInputType,
      ),
    )

  ],);
}

Widget containerBox({required Column columnOfTextFiald,required double width,required double height}){
  return  Container(
                  width: width,
                  height: height,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: columnOfTextFiald
                );
}