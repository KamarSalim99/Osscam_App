import 'package:flutter/material.dart';
import 'package:project_state_mangment/core/constans/app_string.dart';
import 'package:project_state_mangment/view/create_project_page.dart';

import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';

class CreatOrJoinPage extends StatelessWidget {
  const CreatOrJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.infinity,
         height: double.infinity,
         color: backgroundColor,
          child: Column(
            children: [
              Image.asset("assets/images/mastoryoss.png"),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor: secondry
                  ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateProjectPage()));
                }, child: Text(CREATE,style:TextButtonTextStyle)),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor
                  ),
                  onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This is not my flow")));
                               }, child: Text(JOIN,style:joinButtonTextStyle)),
               ),
            ],
          )
      ),
    );
  }
}