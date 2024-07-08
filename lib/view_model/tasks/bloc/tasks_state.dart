class TasksState{}
final class TasksInialState extends TasksState{}
class LoadingState extends TasksState{}
class SuccessState extends TasksState{}
class ErrorState extends TasksState{
  final String message ;
  ErrorState( {required this.message});
}
