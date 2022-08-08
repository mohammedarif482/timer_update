import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer_update/model/users_model.dart';
import '../../controller/users_controller.dart';
import '../../db/hive_boxes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  UsersController controller = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppbar(),
      body: GetBuilder<UsersController>(builder: (controller) {
        if (controller.userModel != null) {
          return usersTileBuilder();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  usersTileBuilder() {
    return ValueListenableBuilder(
        valueListenable: Boxes.getUsers().listenable(),
        builder: (context, Box boxes, _) {
          List<Users> allUsers = boxes.get("allUsers");
          return ListView.builder(
              itemCount: allUsers.length,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (context, index) {
                Users user = allUsers[index];

                return ListTile(
                  onLongPress: () {
                    // controller.getUsersList();
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo[100],
                    child: const Icon(Icons.person),
                  ),
                  title: Text("${user.name}"),
                  subtitle: Text("${user.email}"),
                );
              });
        });
  }

  AppBar getAppbar() {
    return AppBar(
      elevation: 2,
      leading: Icon(
        Icons.home_rounded,
        color: Colors.black,
      ),
      centerTitle: true,
      title: const Text(
        "Home",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu,color: Colors.black,),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
