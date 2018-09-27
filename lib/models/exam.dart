
class Exam {
  final int id;
  final String name;
  final List<ExamDetail> examSubList;
  
  Exam({this.id,this.name,this.examSubList});

  factory Exam.fromJson(Map<String, dynamic> json) {

    var list = json['examSubjectList'] as List;
    
    List<ExamDetail> dataList = list.map((i) => ExamDetail.fromJson(i)).toList();

    return Exam(
      id:json['id'] as int,
      name: json['name'] as String,
      examSubList: dataList,
    );
  }
}

class ExamDetail {
  final int id;
  final String name;
  final String examDateFrom;
  final String examDateTo;
  final String startTime;
  final String endTime;
  
  ExamDetail({this.id,this.name,this.examDateFrom,this.examDateTo,this.startTime,this.endTime});

  factory ExamDetail.fromJson(Map<String, dynamic> json) {
    return ExamDetail(
      id:json['id'] as int,
      name: json['name'] as String,
      examDateFrom:json['examDateFrom'] as String,
      examDateTo:json['examDateTo'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }
}