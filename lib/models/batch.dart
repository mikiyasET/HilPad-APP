class Batch {
  int? id;
  int? startYear;
  String? code;
  int? endYear;

  Batch({this.id, this.endYear, this.code, this.startYear});

  Batch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    endYear = json['end_year'];
    code = json['code'];
    startYear = json['start_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['end_year'] = endYear;
    data['code'] = code;
    data['start_year'] = startYear;
    return data;
  }
}
