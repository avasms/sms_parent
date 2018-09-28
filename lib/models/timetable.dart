class TimeTable {
  final int id;
  final String subjectName;

  
  TimeTable({this.id,this.subjectName});

  factory TimeTable.fromJson(Map<String, dynamic> json) {
    return TimeTable(
      id:json['id'] as int,
      subjectName: json['subjectName'] as String,

    );
  }
}