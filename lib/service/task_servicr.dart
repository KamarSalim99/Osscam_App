import 'package:dio/dio.dart';
import 'package:project_state_mangment/model/response/task_model.dart';

import '../core/config/header_config.dart';
import '../model/handling.dart';
import '../model/response/project_model.dart';
import 'core_service.dart';

abstract class TaskServicr extends CoreService {
  Future<ResultModel> createTask(List<TaskModel> task);  
}

class TaskServicrImp extends TaskServicr{
  
  @override
  Future<ResultModel> createTask(List<TaskModel> task) async{
  List<Map<String,dynamic>> dataToSend=[];
  task.forEach((element)=>dataToSend.add(element.toMap()));
  try{
    response=await dio.post(baseUrl+'/tasks',data: dataToSend,options:HeaderConfig.getHeader());
    print(response.statusCode);
    if(response.statusCode==200){
        return DataSuccessModel();
      }else{
        return ErrorModel();
      }
    
   } on DioException catch(e){
        print(e.message);
        return ExceptionModel(message: e.message!);
    }}

   
   }