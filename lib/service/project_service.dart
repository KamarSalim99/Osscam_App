import 'package:dio/dio.dart';
import 'package:project_state_mangment/model/response/project_model.dart';
import '../core/config/header_config.dart';
import '../model/handling.dart';
import 'core_service.dart';

abstract class ProjectService extends CoreService {
  Future<ResultModel> createProject(ProjectModel project);
}
int? project_id;
class ProjectServiceImp extends ProjectService{
  
  @override
  Future<ResultModel> createProject(ProjectModel project) async{
   try{
    response=await dio.post(baseUrl+'/projects',data: project.toMap(),options:HeaderConfig.getHeader());
    if(response.statusCode==200){
      project_id=response.data["id"];
        return DataSuccessModel();
      }else{
        return ErrorModel();
      }

    }
     on DioException catch(e){
        print(e.message);
        return ExceptionModel(message: e.message!);
    }

  }

}