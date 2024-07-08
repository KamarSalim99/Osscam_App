import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/response/project_model.dart';
import 'package:project_state_mangment/view/tasks_page.dart';
import 'package:project_state_mangment/view_model/creat_project/bloc/creat_project_bloc.dart';
import 'package:project_state_mangment/view_model/creat_project/bloc/creat_project_state.dart';
import 'package:project_state_mangment/view_model/creat_project/bloc/create_project_event.dart';

import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';
import '../core/constans/app_string.dart';

class CreateProjectPage extends StatelessWidget {
  CreateProjectPage({super.key});
  TextEditingController projectName = TextEditingController();
  TextEditingController projectDecription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 117,
                      width: 131,
                      child: Image.asset("assets/images/mastoryoss.png")),
                  Text("Project name", style: projectNameTextStyle),
                  TextFormField(
                    controller: projectName,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Decription", style: projectNameTextStyle),
                  TextFormField(
                    maxLines: 10,
                    controller: projectDecription,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlocProvider(
                  create: (context) => CreatProjectBloc(),
                  child: BlocConsumer<CreatProjectBloc, CreatProjectState>(
                    listener: (context, state) {
                      if (state is SuccessState){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Project is added"),backgroundColor: Colors.grey,));
                      }else if(state is ErrorState){  
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fiald to create project"),backgroundColor: Colors.red,));
                      }
                    },
                    builder: (context, state) {
                      if(state is CreatProjectInialState)
                     { return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondry),
                          onPressed: () {
                           context.read<CreatProjectBloc>().add(SendProjectDataEvent(project: ProjectModel(projectName:projectName.text ,projectDescription:projectDecription.text ,projectStatus:"Backing" )));
                          },
                          child: Text(CREATE, style: TextButtonTextStyle));
                    }else if(state is SuccessState){
                       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TasksPage(),
                          ));
                    });
                    }else if(state is ErrorState){
                      return Column(children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondry),
                          onPressed: () {
                           context.read<CreatProjectBloc>().add(SendProjectDataEvent(project: ProjectModel(projectName:projectName.text ,projectDescription:projectDecription.text ,projectStatus:"Backing" )));
                          },
                          child: Text(CREATE, style: TextButtonTextStyle)),
                      ],);
                    }else{
                      return CupertinoActivityIndicator(color: secondry,);
                    }
                    return SizedBox();
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
