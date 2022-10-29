class Course {
  int? id;
  String? name;
  String? code;
  int? creditHour;

  Course({this.id, this.name, this.code, this.creditHour});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    creditHour = json['credit_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['credit_hour'] = creditHour;
    return data;
  }
}
