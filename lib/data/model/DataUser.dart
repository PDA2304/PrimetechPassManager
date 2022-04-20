import 'package:passmanager/data/model/Data.dart';
import 'package:passmanager/data/model/Employee.dart';

class DataUser {
  int? id;
  Employee? employee;
  IndexData? data;

  DataUser({this.id, this.employee, this.data});

  DataUser.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        employee = Employee.fromJson(json['user']),
        data= IndexData.fromJson(json['data']);

  List<DataUser> allDataUser(List<dynamic> json) {
    List<DataUser> result = <DataUser>[];
    json.forEach((v) {
      result.add(DataUser.fromJson(v));
    });
    return result;
  }

}