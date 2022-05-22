// ignore_for_file: file_names
class ListOFEntities {
  ListOFEntities({this.entityList});
  List<String> entityList = [];
  Map<String, dynamic> jsonpush(String id) =>
      {'id': id, 'entityList': entityList};
  static ListOFEntities fromJson(Map<String, dynamic> json) =>
      ListOFEntities(entityList: json['entityList']);
}
