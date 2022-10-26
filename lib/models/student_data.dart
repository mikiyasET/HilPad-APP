class StudentData {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? batch;
  String? dateOfBirth;
  String? phone;
  String? studentId;

  StudentData(
      {this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.gender,
        this.batch,
        this.dateOfBirth,
        this.phone,
        this.studentId});

  StudentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    gender = json['Gender'];
    batch = json['Batch'];
    dateOfBirth = json['DateOfBirth'];
    phone = json['Phone'];
    studentId = json['StudentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['FirstName'] = firstName;
    data['MiddleName'] = middleName;
    data['LastName'] = lastName;
    data['Gender'] = gender;
    data['Batch'] = batch;
    data['DateOfBirth'] = dateOfBirth;
    data['Phone'] = phone;
    data['StudentId'] = studentId;
    return data;
  }
}
