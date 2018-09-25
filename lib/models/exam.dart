class Exam {
  final int id;
  final String name;
  
  Exam({this.id,this.name});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id:json['id'] as int,
      name: json['name'] as String,
     
    );
  }
}