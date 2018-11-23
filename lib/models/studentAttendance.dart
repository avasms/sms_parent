class StudentAttendance{
  int count;
  String date;
  String status;
  StudentAttendance({
    this.count,
    this.date,
    this.status,
  });
  factory StudentAttendance.fromJson(Map<String,dynamic>json){
    return StudentAttendance(
      count: json['count'] as int,
      date: json['date'] as String,
      status: json['status'] as String
    );
  }
}