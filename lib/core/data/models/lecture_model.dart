class Lecture {
  int? lectureID;
  int? adminId;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? firstDate;
  int? hallLocation;
  String? courseCode;

  Lecture({
     this.lectureID,
     this.startTime,
     this.endTime,
     this.firstDate,
     this.hallLocation,
      this.adminId,
      this.courseCode,


  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      lectureID: json['LectureID'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      firstDate: DateTime.parse(json['firstDate']),
      hallLocation: json['hallLocation'],
      adminId: json['adminId'],
      courseCode: json['courseCode'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime!.toString().split(" ")[1].substring(0, 8),
      'endTime': endTime!.toString().split(" ")[1].substring(0, 8),
      'firstDate': firstDate!.toString().substring(0, 10),
      'hallLocation': hallLocation,
      'adminId': 1,
      'courseCode': courseCode,

    };
  }
}
