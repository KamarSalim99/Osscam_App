import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/handling.dart';
import 'package:project_state_mangment/service/auth_service.dart';
import 'package:project_state_mangment/view_model/login/bloc/login_event.dart';
import 'package:project_state_mangment/view_model/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(LoginInialState()){  //how work here
    on<SendDataEvent>((event,emit)async{
      emit(LoadingState());
      ResultModel result=await AuthServiceImp().logIn(event.user);
      if(result is DataSuccessModel){
        emit(SuccessState());
      }else{  
        emit(ErrorState(message:result.runtimeType.toString()));
      }
    });
  }
}