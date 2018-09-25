
class ExamGrade {
  int studentId;
  int examId;
  int id;
  String studentName;
  String year;
  String subjectName;
  String examName;
  String schoolName;
  String grade;
  String className;
  //final List<ExamGrade> gradeList;
  //List<ExamGrade> gradeList = new List<ExamGrade>();
  List gradeList = ["subjectName", "grade"];

  ExamGrade({
    this.id,
    this.studentId,
    this.examId,
    this.studentName,
    this.examName,
    this.grade,
    this.schoolName,
    this.subjectName,
    this.year,
    this.className,
    this.gradeList,
  });
  Map<String, dynamic> toMap() => {
        'id': this.id,
        'studentId': this.studentId,
        'examId': this.examId,
        'studentName': this.studentName,
        'examName': this.examName,
        'grade': this.grade,
        'schoolName': this.schoolName,
        'subjectName': this.subjectName,
        'year': this.year,
        'gradeList': this.gradeList,
        'className': this.className,
      };
  factory ExamGrade.fromJson(Map<String, dynamic> json) {
    return ExamGrade(
      id: json['id'] as int,
      studentId: json['studentId'] as int,
      examId: json['examId'] as int,
      studentName: json['studentName'],
      schoolName: json['schoolName'],
      examName: json['examName'],
      subjectName: json['subjectName'],
      grade: json['grade'],
      year: json['year'],
      className: json['className'],
      // images: Image.fromJson(parsedJson['images'])
      gradeList: json['gradeList'],
      // gradeList:(json['gradeList']).map((i) => ExamGrade.fromJson(i)).toList()
    );
  }
}
