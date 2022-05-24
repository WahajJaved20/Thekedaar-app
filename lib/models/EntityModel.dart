class Entity {
  String id;
  String name;
  int amount;
  Entity({this.id, this.name, this.amount});
  static Entity fromJson(Map<String, dynamic> json) =>
      Entity(id: json['id'], name: json['name'] ?? '', amount: json['amount']);
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'amount': amount};
}
