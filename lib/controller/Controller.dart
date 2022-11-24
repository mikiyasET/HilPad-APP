import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Controller extends GetxController {
  var currentBatch = "".obs;
  var currentCourse = "".obs;
  var currentBatchID = 0.obs;
  var selectedIndex = 0.obs;
  var currentDay = DateFormat('EEEE').format(DateTime.now()).obs;
  changePage(x) => selectedIndex.value = x;
  changeDay(x) {
    currentDay.value = x;
    print("Day Changed: $x");
  }
}
