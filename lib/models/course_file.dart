class CourseFile {
  int? id;
  int? courseId;
  String? fileId;
  String? fileName;
  int? fileSize;
  int? year;
  String? fileType;
  String? season;
  bool? status;

  CourseFile(
      {this.id,
        this.courseId,
        this.fileId,
        this.fileName,
        this.fileSize,
        this.year,
        this.fileType,
        this.season,
        this.status});

  CourseFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    fileId = json['file_id'];
    fileName = json['file_name'];
    fileSize = json['file_size'];
    year = json['year'];
    fileType = json['file_type'];
    season = json['season'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['file_id'] = fileId;
    data['file_name'] = fileName;
    data['file_size'] = fileSize;
    data['year'] = year;
    data['file_type'] = fileType;
    data['season'] = season;
    data['status'] = status;
    return data;
  }
}
