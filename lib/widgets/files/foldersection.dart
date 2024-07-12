import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/file_screen_controller.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoldersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<FilesScreenController>(
      builder: (FilesScreenController folderController) {
     if(folderController != null && folderController.foldersList !=null){
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: folderController.foldersList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print(
                    "Tapped on folder: ${folderController.foldersList[index].name}");
                // Implement folder tap action
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/folderr.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      folderController.foldersList[index].name,
                      style: textStyle(16, textColor, FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('files')
                          .where('folders',
                              isEqualTo:
                                  folderController.foldersList[index].name)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        int itemCount = snapshot.data?.docs.length ?? 0;
                        return Text(
                          "$itemCount items",
                          style: textStyle(
                              14, Colors.grey[600]!, FontWeight.normal),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
      },
    );
  }
}
