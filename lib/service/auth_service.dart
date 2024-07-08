import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:project_state_mangment/model/request/login_user_model.dart';
import 'package:project_state_mangment/service/core_service.dart';

import '../core/config/header_config.dart';
import '../core/config/hive_init_config.dart';
import '../model/handling.dart';
import '../model/request/signup_user_model.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SignupUserModel user);
  Future<ResultModel> logIn(LoginUserModel user);
}

class AuthServiceImp extends AuthService {

   @override
  Future<ResultModel> signUp(SignupUserModel user) async {
    try {
      response = await dio.post(baseUrl + "/auth/register", data: user.toMap());
      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        await box!.put('token', token);
        return DataSuccessModel();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }
  
  @override
  Future<ResultModel> logIn(LoginUserModel user) async{
    try
    {
      print("ghjkl,mnbhgyuikl");
      response=await dio.post(baseUrl+'/auth/login',data:user.toMap(),);
      print(response.statusCode);
      if(response.statusCode==200){
      return DataSuccessModel();
      }else{
        return ErrorModel();
      }
    }on DioException catch(e){
      print(e.message);
       return ExceptionModel(message: e.message!); 
    }
  }
 
}
