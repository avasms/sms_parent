import 'dart:async';
import 'dart:convert';
import 'package:sms_parent/models/dormitory.dart';
import 'package:sms_parent/models/ferry.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/models/examGrade.dart';
import 'package:sms_parent/models/exam.dart';
import 'package:sms_parent/util/api.dart';
import 'package:sms_parent/util/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiCommonDao{
Future<List<Dormitory>> getDormitoryList() async {
  String url = "/dormitory_data_list";
  
  final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

 final data = response.data;
  if(response != null){
    return data.map<Dormitory>((json) => Dormitory.fromJson(json)).toList();
  }
 return null;
  
}

Future<List<Transport>> getFerryList() async {
  String url = "/transport_data_list";
  
  final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);


 final data = response.data;
  if(response != null){
    return data.map<Transport>((json) => Transport.fromJson(json)).toList();
  }
 return null;
  
}

Future<List<Student>> getStudentList(String parentId) async {
  String url = "/student_data_list/pid=$parentId";
 // print('APO');
 // print(parentId);
  final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

 final data = response.data;
  if(response != null){
    return data.map<Student>((json) => Student.fromJson(json)).toList();
  }
 return null;
  
}


Future<List<Exam>> getExamListByClassId(String classId) async {
  String url = "/listStudentExam/$classId";
 // print('APO');
 // print(parentId);
  final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

 final data = response.data;
  if(response != null){
    return data.map<Exam>((json) => Exam.fromJson(json)).toList();
  }
 return null;
  
}

}