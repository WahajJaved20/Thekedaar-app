import 'package:construction_app/models/EntityModel.dart';

class ProjectModel {
  ProjectModel(
      {this.id,
      this.name,
      this.history,
      this.isHistory,
      this.dateStart,
      this.dateEnd,
      this.status,
      this.entityList});
  String id = "";
  String name = ""; // Project name
  List<ProjectModel> history = []; // keep track of changes
  bool isHistory =
      false; // check to see if project is on main screen or post edit
  String dateStart = ""; // date on which it was opened
  String dateEnd = ""; // date on which it was closed
  bool status = true; // project status 0-closed 1-open
  List<Map<String, dynamic>>
      entityList; // a list of entities currently interacting
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'history': history,
        'isHistory': isHistory,
        'dateStart': dateStart,
        'dateEnd': dateEnd,
        'status': status,
        'entityList': entityList
      };
  static ProjectModel fromJson(Map<String, dynamic> json) => ProjectModel(
      id: json['id'],
      name: json['name'] ?? '',
      history: json['history'],
      isHistory: json['isHistory'],
      dateStart: json['dateStart'],
      dateEnd: json['dateEnd'],
      status: json['status'],
      entityList: json['entityList']);
}
