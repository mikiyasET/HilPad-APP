import '../models/batch.dart';
import '../models/student.dart';
import '../models/user.dart';
import '../utils/universal_helper_functions.dart';

Future<dynamic>? SettingHelper() async {
  try {
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    Batch batch = await getItem(bm: Batch(), id: student.batch);
    return {"user": user, "student": student, "batch": batch};
  } catch (e) {
    print(e);
  }
}
