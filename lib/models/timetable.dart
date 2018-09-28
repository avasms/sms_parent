class TimeTable {
  final int id;
  final String subjectName;
  final String startTime;
  final String endTime;
  
  TimeTable({this.id,this.subjectName,this.startTime,this.endTime});

  factory TimeTable.fromJson(Map<String, dynamic> json) {
    return TimeTable(
      id:json['id'] as int,
      subjectName: json['subjectName'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }
}