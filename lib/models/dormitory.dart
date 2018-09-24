class Dormitory{
  int id;
  String name;
  int roomNo;
  String description;
  String schoolName;
  String teacherName;
  Dormitory({
    this.id,
    this.name,
    this.roomNo,
    this.description,
    this.schoolName,
    this.teacherName,

 });


 factory Dormitory.fromJson(Map<String, dynamic> json) {
    return Dormitory(
      id: json['id'] as int,
      name: json['name'] as String,
      roomNo: json['roomNo'] as int,
      description: json['description'] as String,
      schoolName: json['schoolName'] as String,
      teacherName: json['teacherName'] as String,
    );
  }
}
