import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/screen/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screen/nav_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Root(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Root extends StatelessWidget {
  AuthController _authController = Get.put(AuthController());

  @override
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _authController.user.value == null ? LoginScreen() : NavScreen();
    });
  }
}
