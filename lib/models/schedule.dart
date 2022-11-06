import 'package:hilpad/constants/api_constants.dart';
import 'package:hilpad/models/basemodel.dart';

class ScheduleModel extends BaseModel{
  int? id;
  String? day;
  String? period;
  int? courseID;
  int? batchID;
  String? section;
  String? type;
  String? room;

  ScheduleModel(
      {this.id,
        this.day,
        this.period,
        this.courseID,
        this.batchID,
        this.section,
        this.type,
        this.room}) : super(controller: schedule);

  ScheduleModel.fromJson(Map<String, dynamic> json) : super(controller: schedule) {
    id = json['id'];
    day = json['day'];
    period = json['period'];
    courseID = json['courseID'];
    batchID = json['batchID'];
    section = json['section'];
    type = json['type'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['period'] = period;
    data['courseID'] = courseID;
    data['batchID'] = batchID;
    data['section'] = section;
    data['type'] = type;
    data['room'] = room;
    return data;
  }

  static List<ScheduleModel> baseModelToType(List<BaseModel> bm){
    return bm.map((e) => e as ScheduleModel).toList();
  }
}
