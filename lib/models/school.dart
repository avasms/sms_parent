class School {
  int id;
  String schoolName;
  String address;
  String phone;
  String photoPath;
  String runningYear;
  String email;
  
  School({
  this.id,
  this.schoolName,
  this.address,
  this.phone,
  this.photoPath,
  this.runningYear,
  this.email});
  
  factory School.fromJson(Map<String,dynamic>json){
    return School(
      id: json['id'] as int,
      schoolName: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      photoPath: json['photoPath'] as String,
      runningYear: json['runningYear'] as String,
      email: json['email'] as String,
    );

  }
}