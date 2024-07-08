import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/view_model/signup/bloc/signup_event.dart';
import 'package:project_state_mangment/view_model/signup/bloc/signup_state.dart';
import 'package:project_state_mangment/model/handling.dart';
import 'package:project_state_mangment/service/auth_service.dart';

class SignupBloc extends Bloc<SignUpEvent,SignUpState>{
  SignupBloc():super(SignUpInialState()){
    on<SendDataEvent>((event,emit) async{
      emit(LoadingState());
      ResultModel result=await AuthServiceImp().signUp(event.user);
      if(result is DataSuccessModel){
        emit(SuccessState());
      }else{
        emit(ErrorState(message: result.runtimeType.toString()));
      }
    });
  }
}