import 'package:hive/hive.dart';
part 'users_model.g.dart';

class UserModel {
  List<Users>? users = [];
  UserModel({this.users});

  UserModel.fromJson(List json) {
    json.forEach((v) {
      users!.add(Users.fromJson(v));
    });
  }
}

@HiveType(typeId: 0)
class Users extends HiveObject {
  @HiveField(0)
  int? postId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? email;

  Users({this.postId, this.id, this.name, this.email});

  Users.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
