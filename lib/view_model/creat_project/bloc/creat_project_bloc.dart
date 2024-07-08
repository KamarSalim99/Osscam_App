import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/handling.dart';
import 'package:project_state_mangment/service/project_service.dart';
import 'package:project_state_mangment/view_model/creat_project/bloc/creat_project_state.dart';
import 'package:project_state_mangment/view_model/creat_project/bloc/create_project_event.dart';

class CreatProjectBloc extends Bloc<CreateProjectEvent,CreatProjectState>{
  CreatProjectBloc():super(CreatProjectInialState()){
    on<SendProjectDataEvent>(
      (event,emit)async{
      emit(LoadingState());
      ResultModel result=await ProjectServiceImp().createProject(event.project);
      if(result is DataSuccessModel){
        emit(SuccessState());
      }else{
        emit(ErrorState(message: result.runtimeType.toString()));
      }
    });
  }
}