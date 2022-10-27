class Student {
  int? id;
  String? fname;
  String? lname;
  String? tgId;
  String? tgUsername;
  int? batch;
  String? lang;
  int? studentDataID;
  bool? status;

  Student(
      {this.id,
        this.fname,
        this.lname,
        this.tgId,
        this.tgUsername,
        this.batch,
        this.lang,
        this.studentDataID,
        this.status});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    tgId = json['tg_id'];
    tgUsername = json['tg_username'];
    batch = json['batch'];
    lang = json['lang'];
    studentDataID = json['studentDataID'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['tg_id'] = tgId;
    data['tg_username'] = tgUsername;
    data['batch'] = batch;
    data['lang'] = lang;
    data['studentDataID'] = studentDataID;
    data['status'] = status;
    return data;
  }
}
