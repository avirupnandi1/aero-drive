import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class NavigationController extends GetxController {
  RxString tab = "Storage".obs;

  changeTab(String givenTab) {
    tab.value = givenTab;
  }
}
