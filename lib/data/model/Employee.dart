/**
 * Модель для работы с пользователями
 */
class Employee {
  final int id;
  final String role;
  final String token;
  final String userName;
  final String login;
  final String password;

  Employee({
    this.id = 1,
    this.role = '',
    this.token = '',
    this.userName = '',
    this.login = '',
    this.password = '',
  });

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        role = json['role'],
        token = json['token'],
        userName = json['user_name'],
        login = json['login'],
        password = json['password'];

  toError(Map<String, dynamic> json) => {
        "user_name": json['user_name'],
        "login": json['login'],
        "password": json['password']
      };

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'login': login,
        'password': password,
      };
}
