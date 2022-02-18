/// Модель данных для работы с данными пользователя
class Data {
  final int? id;
  final int userId;
  final String name;
  final String login;
  final String password;
  final String description;

  Data({
    this.id,
    this.userId = -1,
    this.name = '',
    this.login = '',
    this.password = '',
    this.description = '',
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        name = json['name'],
        login = json['login'],
        password = json['password'],
        description = json['description'];

  toError(Map<String, dynamic> json) => {
        "name": json["name"] == null ? null : json["name"][0],
        "login": json["login"] == null ? null : json["login"][0],
        "password":
            json["password"] == null ? null : json["password"][0],
        "description": json["description"] == null
            ? null
            : json["description"][0]
      };

  Map<String, dynamic> toJsonAdd() => {
        'user_id': userId,
        'name': name,
        'login': login,
        'password': password,
        'description': description,
      };
}
