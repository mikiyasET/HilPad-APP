import 'package:get/get.dart';

class SettingsController extends GetxController {
  var batch = "".obs;
  var section = "".obs;
  var batchSection = "".obs;

  changeText() => batchSection.value = "$batch$section";
  setBatch(data) => batch.value = data.toString().toUpperCase();
  setSection(data) => section.value = data.toString().toUpperCase();
}
