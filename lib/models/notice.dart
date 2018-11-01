class Notice{
  int id;
  String title;
  String filePath;
  String description;
  String date;
  
  Notice({
    this.id,
     this.title,
    this.filePath,
    this.description, 
    this.date
 });


 factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['id'] as int,
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      description: json['description'] as String,
      date: json['noticeDate'] as String
    );
  }
}
