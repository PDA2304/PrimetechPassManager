import 'package:passmanager/data/model/Action.dart';

import 'DataUser.dart';

class DataInfo {
  int? userId;
  String? userName;
  List<Action>? action;
  String? created;
  String? update;
  List<DataUser>? share;

  DataInfo(
      {this.userId, this.userName, this.action, this.created, this.update,this.share});

  DataInfo.fromJson(Map<String, dynamic> json)
      : userId = json["user_id"],
        userName = json["user_name"],
        action = Action().allAction(json["action"]),
        created = json["created_at"],
        update = json["updated_at"],
        share = DataUser().allDataUser(json['user_share']);

}
