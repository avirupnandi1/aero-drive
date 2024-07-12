import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/file_screen_controller.dart';
import 'package:myapp/firebase_service.dart';
import 'package:myapp/screen/nav_screen.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widgets/files/foldersection.dart';
import 'package:myapp/widgets/files/recentfiles.dart';

class FileScreen extends StatelessWidget {
  TextEditingController foldercontroller = TextEditingController();
  FilesScreenController filesScreenController =
      Get.put(FilesScreenController());

  openAddFolderDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(top: 10, right: 28, bottom: 20),
          title: Text('Add New Folder'),
          content: TextFormField(
            controller: foldercontroller,
            autofocus: true,
            style: textStyle(14, textColor, FontWeight.w600),
            decoration: InputDecoration(
                hintText: 'Enter folder name',
                filled: true,
                fillColor: Colors.grey[250]),
          ),
          actions: [
            InkWell(
              child: Text('Cancel'),
              onTap: () {
                Get.back();
              },
            ),
            InkWell(
              child: Text('Add'),
              onTap: () {
                userCollection
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('folders')
                    .add({
                  'name': foldercontroller.text,
                  'time': DateTime.now()
                });

                Get.offAll(NavScreen());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 3),
        child: Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [Recentfiles(), FoldersSection()],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 14.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () => openAddFolderDialog(context),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(EvaIcons.folderAdd,
                                        color: Colors.grey, size: 32),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Folder",
                                        style: textStyle(
                                            20, Colors.black, FontWeight.w600))
                                  ],
                                ),
                                InkWell(
                                  onTap: () => FirebaseService().uploadFile(''),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Upload",
                                          style: textStyle(20, Colors.black,
                                              FontWeight.w600)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(EvaIcons.upload,
                                          color: Colors.grey, size: 32),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ));
                    },
                  );
                },
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
