import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/core/constans/app_string.dart';
import 'package:project_state_mangment/model/response/task_model.dart';
import 'package:project_state_mangment/service/project_service.dart';
import 'package:project_state_mangment/view_model/tasks/bloc/tasks_Bloc.dart';
import 'package:project_state_mangment/view_model/tasks/bloc/tasks_event.dart';
import 'package:project_state_mangment/view_model/tasks/bloc/tasks_state.dart';

import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';
import 'project_page.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  List<TextEditingController> controllers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 117,
                  width: 131,
                  child: Image.asset("assets/images/mastoryoss.png"),
                ),
                Text("Tasks", style: projectNameTextStyle),
                StatefulBuilder(builder: (context, refresh) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: counter.value,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 243,
                                height: 70,
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: lightPurople),
                                child: TextField(
                                  controller: controllers[index],
                                  //controller:(counter.value!=0)?TextEditingController:TextEditingController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  refresh(() {
                                    controllers.add(TextEditingController());
                                    counter.value++;
                                  });
                                },
                                icon: Icon(Icons.add))),
                      )
                    ],
                  );
                })
              ]))),
      floatingActionButton: BlocProvider(
        create: (context) => TasksBloc(),
        child: BlocConsumer<TasksBloc, TasksState>(
          listener: (context, state) {
            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Faild to Create tasks,Try again"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is TasksInialState) {
              return SizedBox(
                width: 283,
                height: 60,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    List<TaskModel> listTasks = List.generate(
                        controllers.length,
                        (index) => TaskModel(
                            taskDescription: controllers[index].text,
                            taskStatus: 'NEW',
                            project_id: project_id!));
                    context
                        .read<TasksBloc>()
                        .add(SendDataEvent(task: listTasks));
                  },
                  backgroundColor: secondry,
                  label: Text(CREATE, style: TextButtonTextStyle),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            } else if (state is SuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectPage(),
                    ));
              });
            } else if (state is ErrorState) {
              SizedBox(
                width: 283,
                height: 60,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    List<TaskModel> listTasks = List.generate(
                        controllers.length,
                        (index) => TaskModel(
                            taskDescription: controllers[index].text,
                            taskStatus: 'Backing',
                            project_id: index));
                    context
                        .read<TasksBloc>()
                        .add(SendDataEvent(task: listTasks));
                  },
                  backgroundColor: secondry,
                  label: Text(CREATE, style: TextButtonTextStyle),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            } else {
              return CupertinoActivityIndicator(
                color: secondry,
              );
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
