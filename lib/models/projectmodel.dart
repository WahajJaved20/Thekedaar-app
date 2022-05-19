import 'package:construction_app/models/entities.dart';

class ProjectModel {
  String name; // Project name
  List<ProjectModel> history; // keep track of changes
  bool isHistory; // check to see if project is on main screen or post edit
  String dateStart; // date on which it was opened
  String dateEnd; // date on which it was closed
  bool status; // project status 0-closed 1-open
  List<Entities> entityList; // a list of entities currently interacting
}
