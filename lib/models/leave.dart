class Leave{
  int id;
  String description;
  String name;
  String adminName;
  String dateFromDate;
  String dateToDate;
  Leave({
    this.id,
    this.description,
    this.name,
    this.adminName,
    this.dateFromDate,
    this.dateToDate,
  });
  factory Leave.fromJson(Map<String,dynamic>json){
    return Leave(
      id: json ['id'] as int,
      description: json['description'] as String,
      name: json['name'] as String,
      adminName: json['adminName'] as String,
      dateFromDate: json['datefromDate'] as String,
      dateToDate: json['datetoDate'] as String,

    );
  }
}