import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class  UploadOptions extends StatelessWidget {
  Widget colouredContainer(Color bgcolor, Icon icon, String option, String title){
// Suggested code may be subject to a license. Learn more: ~LicenseLog:744764097.
    return Container( width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: bgcolor),
        child: Center(child: icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        colouredContainer(
            Colors.lightBlue.withOpacity(0.2),
            Icon(
              Icons.image,
              color: Colors.cyan,
              size: 30,
            ),
            "image",
            "Images"),
        colouredContainer(
            Colors.pink.withOpacity(0.3),
            Icon(Icons.play_arrow_rounded,
                color: Colors.pink.withOpacity(0.5), size: 42),
            "video",
            "Videos"),
        colouredContainer(
            Colors.blue.withOpacity(0.4),
            Icon(EvaIcons.fileText,
                color: Colors.indigoAccent.withOpacity(0.5), size: 30),
            "application",
            "Documents"),
        colouredContainer(
            Colors.purple.withOpacity(0.2),
            Icon(EvaIcons.music, color: Colors.pink.withOpacity(0.3), size: 30),
            "audio",
            "Audio"),
      ],
    );
  }
}