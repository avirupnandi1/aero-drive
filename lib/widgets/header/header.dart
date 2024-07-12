import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myapp/controller/navigation_controller.dart';
import 'package:myapp/utils.dart';

class header extends StatelessWidget {
  NavigationController navcontroller = Get.put(NavigationController());

  Widget tabCell(String text, bool selected, BuildContext context) {
    return selected
        ? Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.41 - 5,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 248, 4, 4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.025),
                      offset: Offset(10, 10),
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.025),
                      offset: Offset(-10, 10),
                      blurRadius: 10)
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: textStyle(23, Colors.white, FontWeight.bold),
                ),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.45 - 10,
            height: 60,
            child: Center(
              child: Text(
                text,
                style: textStyle(23, textColor, FontWeight.bold),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          Text(
            "Aero-Drive",
            style: textStyle(
                28, Color.fromARGB(255, 126, 123, 123), FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      offset: Offset(10, 10),
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      offset: Offset(-10, 10),
                      blurRadius: 10)
                ],
              ),

              child: Obx(
                () => Row(children: [
                  InkWell(
                    onTap: () => navcontroller.changeTab("Storage"),
                    child: tabCell("Storage",
                        navcontroller.tab.value == "Storage", context),
                  ),
                  InkWell(
                    onTap: () => navcontroller.changeTab("Files"),
                    child: tabCell(
                        "Files", navcontroller.tab.value == "Files", context),
                  ),
                ]),
              ))
        ]));
  }
}
