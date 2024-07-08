import 'package:project_state_mangment/model/response/project_model.dart';

class CreateProjectEvent{}
class SendProjectDataEvent extends CreateProjectEvent {
  ProjectModel project;
  SendProjectDataEvent({
    required this.project,
  });
}
