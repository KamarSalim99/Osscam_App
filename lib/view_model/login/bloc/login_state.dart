class LoginState{}
final class LoginInialState extends LoginState{}
class SuccessState extends LoginState{}
class ErrorState extends LoginState{
 final String message;
 ErrorState({required this.message});
}
class LoadingState extends LoginState{}