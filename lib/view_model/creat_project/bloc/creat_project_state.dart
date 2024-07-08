class CreatProjectState{}
final class CreatProjectInialState extends CreatProjectState{}
class SuccessState extends CreatProjectState{}
class ErrorState extends CreatProjectState{
 final String message;
 ErrorState({required this.message});
}
class LoadingState extends CreatProjectState{}