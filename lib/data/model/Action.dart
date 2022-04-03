import 'package:passmanager/data/model/Employee.dart';

class Action {
  final String? actionDate;
  Employee? employee;
  final String typeAction;

  Action({this.actionDate = "", this.employee,this.typeAction = ""});

  Action.fromJson(Map<String, dynamic> json)
      : actionDate = json['action_date'],
        employee = Employee.fromJson(json["empoyee"]),
        typeAction = json["type_action_name"];

  List<Action> allAction(List<dynamic> json) {
    List<Action> result = <Action>[];
    json.forEach((v) {
      result.add(Action.fromJson(v));
    });
    return result;
  }
}
