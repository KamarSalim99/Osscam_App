import 'package:project_state_mangment/model/request/signup_user_model.dart';

class SignUpEvent{}
class SendDataEvent extends SignUpEvent{
  final SignupUserModel user;
  SendDataEvent({required this.user});
}