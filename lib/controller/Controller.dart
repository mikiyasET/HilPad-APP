import 'package:get/get.dart';

class Controller extends GetxController {

  var currentBatch = "".obs;
  var currentCourse = "".obs;
  var currentBatchID = 0.obs;
  var selectedIndex = 0.obs;

  changePage(x) => selectedIndex.value = x;
}
