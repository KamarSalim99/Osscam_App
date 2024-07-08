import 'package:project_state_mangment/model/response/task_model.dart';

class TasksEvent{}
class SendDataEvent extends TasksEvent{
  final List<TaskModel> task;
  SendDataEvent({required this.task});
}