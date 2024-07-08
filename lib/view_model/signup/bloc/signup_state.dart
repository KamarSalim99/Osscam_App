class SignUpState{}
final class SignUpInialState extends SignUpState{}
class LoadingState extends SignUpState{}
class SuccessState extends SignUpState{}
class ErrorState extends SignUpState{
  final String message ;
  ErrorState( {required this.message});
}
