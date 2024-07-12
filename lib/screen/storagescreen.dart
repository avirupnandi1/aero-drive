import 'package:flutter/material.dart';
import 'package:myapp/widgets/storage/storage_container.dart';
import 'package:myapp/widgets/storage/uploadoptions.dart';

class Storagescreen extends StatelessWidget {
  const Storagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const SizedBox(height:30),
      StorageContainer(),
      SizedBox(height: 20,),
      UploadOptions()

      ],
    );
  }
}