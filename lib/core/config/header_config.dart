import 'package:dio/dio.dart';
import 'package:project_state_mangment/core/config/hive_init_config.dart';

import '../../service/auth_service.dart';

class HeaderConfig{
 static Options getHeader({useToken=true}){
  if(useToken){
    return Options(
     headers: {'accept':' */*' ,
     'Authorization': 'Bearer ${box!.get('token')} '}
    );
  }else{
    return Options(
      headers: {'Content-Type': 'application/json'}
    );
  }
 } 
}