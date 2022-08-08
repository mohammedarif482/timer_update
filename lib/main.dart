import 'package:flutter/material.dart';
import 'package:timer_update/view/pages/home_page.dart';

import 'db/hive_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Boxes.configHiveBoxes();
  await Boxes.openBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
