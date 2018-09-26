class Student{
  int id;
  String name;
 String runningYear;
  String studentNo;
  String admissionNo;
  String schoolName;
  String photoPath;
  String rollNo;
  String className;
  int classLevelId;
  Student({
    this.id,
    this.name,
    this.studentNo,
    this.admissionNo,
    this.schoolName,
    this.photoPath,
    this.rollNo,
    this.runningYear,
    this.className,
    this.classLevelId,
 });


 factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      name: json['name'] as String,
      studentNo: json['studentNo'] as String,
      admissionNo: json['admissionNo'] as String,
      schoolName: json['schoolName'] as String,
      photoPath: json['photoPath'] as String,
      rollNo: json['rollNo'] as String,
      runningYear: json['runningYear'] as String,
      className:json['className'] as String ,
      classLevelId:json['classLevelId'] as int ,
    );
  }
}
