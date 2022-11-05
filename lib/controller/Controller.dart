import 'package:get/get.dart';

class Controller extends GetxController {

  var currentBatch = "".obs;
  var currentCourse = "".obs;
  var selectedIndex = 0.obs;

  changePage(x) => selectedIndex.value = x;
}
