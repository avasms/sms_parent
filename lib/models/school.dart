import 'package:flutter/material.dart';
class School {
  int id;
  String  schoolName;
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
      schoolName: json['schoolName'] as String,
      address: json['schoolLogo'] as String,
      phone: json['about'] as String,
      photoPath: json['id'] as String,
      runningYear: json['schoolName'] as String,
      email: json['schoolLogo'] as String,
    );

  }
}