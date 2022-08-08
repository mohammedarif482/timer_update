import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:timer_update/model/response_model.dart';
import 'package:timer_update/model/users_model.dart';
import '../db/hive_boxes.dart';
import '../users_repo/users_repo.dart';

class UsersController extends GetxController {
  Timer? timer;

  List<Users> users = [];
  UserModel? userModel;
  int pageNo = 0;

  final box = Boxes.getUsers();

  getUsersList() async {
    ApiResponseModel usersResponse = await usersRepo.getUsersInfo(
        "http://jsonplaceholder.typicode.com/posts/${(pageNo + 1)}/comments");

    userModel = UserModel.fromJson(usersResponse.getResponseModel);

    if (userModel != null) {
      users = userModel!.users!;
      log(users[0].name.toString());
      update();

      // await Boxes.clearUsers();

      box.put("allUsers", users);
      pageNo++;
    } else {}

    print("Fuction called $pageNo");
  }

  @override
  void onInit() async {
    getUsersList();
    timer =
        Timer.periodic(const Duration(minutes: 5), (Timer t) => getUsersList());
    super.onInit();
  }

}

