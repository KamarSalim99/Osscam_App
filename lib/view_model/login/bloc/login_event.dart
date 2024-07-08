import 'package:project_state_mangment/model/request/login_user_model.dart';

class LoginEvent{}
class SendDataEvent extends LoginEvent{
  final LoginUserModel user;
  SendDataEvent({required this.user });

}