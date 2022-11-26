import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/user.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

Future<bool>? isUserConnected() async {
  try {
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    if (student == null) {
      return false;
    } else {
      return true;
    }
  } catch (e) {
    return false;
    print(e);
  }
}
