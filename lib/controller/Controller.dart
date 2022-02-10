import 'package:get/get.dart';

class Controller extends GetxController {
  var selectedIndex = 0.obs;
  changePage(x) => selectedIndex.value = x;
}
