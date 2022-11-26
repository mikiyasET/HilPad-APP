import '../models/batch.dart';
import '../models/student.dart';
import '../models/user.dart';
import '../utils/universal_helper_functions.dart';

Future<dynamic>? SettingHelper() async {
  User user = await getItem(bm: User(), subPath: "token");
  Student student = await getItem(bm: Student(), id: user.stuId);
  Batch batch = await getItem(bm: Batch(), id: student.batch);

  return [user, student, batch];
}

Future<dynamic>? BatchHelper() async {
  try {
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    Batch batch = await getItem(bm: Batch(), id: student.batch);
    var batches = await getItemList(bm: Batch(), subPath: "/");
    return [batch, batches, student];
  } catch (e) {
    print(e);
  }
}
