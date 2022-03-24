class Trash {
  int? id;
  String name;
  String createdAt;
  bool check;

  Trash({this.id, this.name = "", this.createdAt = "",this.check = false});

  Trash.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        createdAt = json['created_at'],
        check = false;

  List<Trash> allData(List<dynamic> json) {
    List<Trash> result = <Trash>[];
    json.forEach((v) {
      result.add(Trash.fromJson(v));
    });
    return result;
  }
}