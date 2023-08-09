import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/controller.dart';

import 'pages/home_page.dart';

void main() {
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
