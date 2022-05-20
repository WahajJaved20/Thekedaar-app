// ignore_for_file: file_names
class ListOFEntities {
  List<String> entityList = [
    "False Ceiling",
    "Color Labour",
    "Color Material",
    "Tile Labour",
    "Tile material",
    "Electric Labour",
    "Electric Material",
    "Plumbing Labour",
    "Plumbing Material",
    "Carpenter Labour",
    "Carpenter Material",
    "Glass Labour",
    "Glass Material",
    "Demolish Labour",
    "Grill Work",
    "Polish Labour",
    "Polish Material",
    "Reti",
    "Cement",
    "Bond",
    "AC Labour",
    "AC Material",
    "Malba / Cleaning",
    "Mason Labour",
    "Shoaib Bhai",
    "Misc"
  ];
  Map<String, dynamic> jsonpush(String id) =>
      {'id': id, 'entityList': entityList};
}
