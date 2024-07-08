import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/handling.dart';
import 'package:project_state_mangment/view_model/tasks/bloc/tasks_event.dart';
import 'package:project_state_mangment/view_model/tasks/bloc/tasks_state.dart';

import '../../../service/task_servicr.dart';

class TasksBloc extends Bloc<TasksEvent,TasksState>{
  TasksBloc():super(TasksInialState()){
    on<SendDataEvent>((event,emit)async{
      ResultModel result=await TaskServicrImp().createTask(event.task);
      emit(LoadingState());
      if(result is DataSuccessModel){
        emit(SuccessState());
      }else{
        emit(ErrorState(message: result.runtimeType.toString()));
      }

    });
  }
}