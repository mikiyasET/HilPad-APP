import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/user.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

Future<dynamic>? CourseFilesHelper() async {
  try {
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    Batch batch = await getItem(bm: Batch(), id: student.batch);
    var courses =
        await getItemList(bm: Course(), subPath: "batch/${batch.code}");
    var courseFiles = [];
    for (var item in courses) {
      var courseFile =
          await getItemList(bm: CourseFile(), subPath: "course", id: item.id);
      courseFiles.add(courseFile);
    }

    return [courses, courseFiles];
  } catch (e) {
    print(e);
  }
}
