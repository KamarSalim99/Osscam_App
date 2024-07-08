import 'package:flutter/material.dart';

import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 342,
                  height:51 ,
                  decoration: BoxDecoration(
                    color:lightgreen,
                    borderRadius: BorderRadius.circular(15)
                    ),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: backgroundColor,)),
                        Text("project name",style:projectNameTextStyle),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: backgroundColor,)),

                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Container(
                    width: 316,
                    height:225 ,
                    decoration: BoxDecoration(
                      color:lightbrown,
                      borderRadius: BorderRadius.circular(15)
                      ),child: Text("description")
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: ListView.builder(shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return  Container(
                  width: 100,
                  height:73 ,
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.only(left:5 ,right: 5,bottom:5 ),
                  decoration: BoxDecoration(
                    color:lightgreen,
                    borderRadius: BorderRadius.circular(7)
                    ),child: Column(
                      children: [
                        Row(children: [
                          Text("Backing",style: TextStyle(color: Color(0xFF3055D0),fontSize: 10,fontWeight: FontWeight.w400),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.bug_report_outlined))
                        ],),
                        Container(
                  width: 90,
                  height:28 ,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                    child: Text("Tasks"),
                    ),
                      ],
                    ),
                    );
                    })),
                  Expanded(child: Column()),
                  Expanded(child: Column()),
                ],)
              ],
            ),
          ))
    );
  }
}