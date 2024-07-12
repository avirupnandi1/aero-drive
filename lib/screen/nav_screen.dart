import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/navigation_controller.dart';
import 'package:myapp/screen/file_screen.dart';
import 'package:myapp/screen/storagescreen.dart';
import 'package:myapp/widgets/header/header.dart';
import 'package:myapp/widgets/storage/uploadoptions.dart';

class NavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: AppBar(backgroundColor: Colors.white, elevation: 0),
      ),
      body: Column(
        children: [
          header(),
          Obx(() {
            return Get.find<NavigationController>().tab.value == "Storage"
                ? Storagescreen()
                : FileScreen();
          }),
        ],
      ),
    );
  }
}
