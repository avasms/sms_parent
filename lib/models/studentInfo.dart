class StudentInfo{
  int id;String name;String nrc;String birthday;
  String admissionNo;String race;
  String religion;String citizens;
  String homeTown;String guestsNo;
  String gender;String currentAdress;
  String phone;String email;
  int roomNo;double withdrawAmount;
  double depositAmount;String photoPath;
  String studentNo;String diseaseIdList;
  String rollNo;int parent;
  int classLevel;int section;
  int dormitory;String relation;
  //List<String> foodList;
  int userId;
  String passward;String runningYear;
  String parentNrc;String className;
  String sectionName;String dormitoryName;
  //List<String> subjectMark;
  String studentBarCode;
  String status;String schoolName;
  int schoolId;String boarderStatus;

  StudentInfo({this.id,this.name,this.nrc,this.birthday,this.admissionNo,this.race,this.religion,this.citizens,this.homeTown,this.guestsNo,
  this.gender,this.currentAdress,this.phone,this.email,this.roomNo,this.depositAmount,this.withdrawAmount,
  this.photoPath,this.studentNo,this.parent,this.diseaseIdList,
  this.rollNo,this.classLevel,
  this.dormitory,this.section,this.relation,//this.foodList,
  this.userId,this.passward,this.runningYear,
  this.parentNrc,this.className,this.sectionName,this.dormitoryName,
  //this.subjectMark,
  this.studentBarCode,
  this.status,this.schoolName,this.schoolId,this.boarderStatus,});

  factory StudentInfo.fromJson(Map<String,dynamic>json){
    return StudentInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      nrc: json['nrc'] as String,
      birthday:json['birthday'] as String,
      admissionNo: json['admissionNo'] as String,
      race: json['race'] as String,
      relation: json['relation'] as String,
      citizens:json['citizens'] as String,
      homeTown: json['homeTown'] as String,
      guestsNo: json['guestsNo'] as String,
      gender: json['gender'] as String,
      currentAdress: json['currentAdress'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      roomNo:json['roomNo'] as int,
      withdrawAmount: json['withdrawAmount'] as double,
      depositAmount: json['depositAmount'] as double,
      photoPath: json['photoPath'] as String,
      studentNo: json['studentNo'] as String,
      rollNo: json['rollNo'] as String,
      section: json['section'] as int,
      dormitory:json['dormitory'] as int,
      religion: json['religion'] as String,
      //foodList: json['foodList'] as List,
      userId: json['userId'] as int,
      passward: json['passward'] as String,
      runningYear: json['runningYear'] as String,
      parentNrc: json['parentNrc'] as String,
      className:json['className'] as String,
      sectionName: json['sectionName'] as String,
      dormitoryName: json['dormitoryName'] as String,
      //subjectMark: json['subjectMark'] as List,
      studentBarCode: json['studentBarCode'] as String,
      status: json['status'] as String,
      schoolName: json['schoolName'] as String,
      schoolId: json['schoolId'] as int,
      boarderStatus: json['boarderStatus'] as String,
      classLevel: json['classLevel'] as int,
      diseaseIdList: json['diseaseIdList'] as String,
      parent: json['parent'] as int,
  

    );
  }


}