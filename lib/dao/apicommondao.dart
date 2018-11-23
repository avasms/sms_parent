import 'dart:async';
import 'dart:convert';
import 'package:sms_parent/models/admin.dart';
import 'package:sms_parent/models/dormitory.dart';
import 'package:sms_parent/models/timetable.dart';
import 'package:sms_parent/models/ferry.dart';
import 'package:sms_parent/models/student.dart';
import 'package:sms_parent/models/examGrade.dart';
import 'package:sms_parent/models/exam.dart';
import 'package:sms_parent/models/notice.dart';
import 'package:sms_parent/models/message.dart';
import 'package:sms_parent/models/school.dart';
import 'package:sms_parent/models/leave.dart';
import 'package:sms_parent/models/studentInfo.dart';
import 'package:sms_parent/models/studentPayment.dart';
import 'package:sms_parent/util/api.dart';
import 'package:sms_parent/util/config.dart';

class ApiCommonDao {
  Future<List<Dormitory>> getDormitoryList() async {
    String url = "/dormitory_data_list";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Dormitory>((json) => Dormitory.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Transport>> getFerryList() async {
    String url = "/transport_data_list";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Transport>((json) => Transport.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Student>> getStudentList(String parentId) async {
    String url = "/student_data_list/$parentId";
    
    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Student>((json) => Student.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<ExamGrade>> getExamGradeList(String studentId) async {
    String url = "/student_mark_data_list/$studentId";
    // print('APO');
    print(url);
    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    //print(data);
    if (response != null) {
      return data.map<ExamGrade>((json) => ExamGrade.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Exam>> getExamListByClassId(String classId) async {
    String url = "/listStudentExam/$classId";
    // print('APO');
    //print(classId);

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    //print(data);
    if (response != null) {
      return data.map<Exam>((json) => Exam.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<TimeTable>> getTimeTableListByClassId(
      String sectionId, String day) async {
    String url = "/studentTimeTable?day=$day&sid=$sectionId";
    print(sectionId);
    print(url);

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
// print(data);
    if (response != null) {
      return data.map<TimeTable>((json) => TimeTable.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<AdminStaff>> getAdminManagementList() async {
    String url = "/admin_management_list";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);
    //print(response);
    final data = response.data;
    if (response != null) {
      return data.map<AdminStaff>((json) => AdminStaff.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Notice>> getNoticeList() async {
    String url = "/notice_data_list";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);
    final data = response.data;
    print(data);
    if (response != null) {
      return data.map<Notice>((json) => Notice.fromJson(json)).toList();
    }
    return null;
  }

  static checkOldPassword(
      String userId, String oldPassword, String newPassword) async {
    var result;
    String url = "/check_user_by_oldpassword";
    var data = {
      "id": userId,
      "oldPassword": oldPassword,
      "password": newPassword
    };
    var res = await HttpAPIManager.postWithParam(url, data, "post");
    print(res.data['id']);
    result = res.data['id'];

    if (result != null) {
      return true;
    }
    return false;
  }

  Future<List<Message>> getReceivedMessageData(String userId) async {
    String url = "/received_messages_api?userId=$userId";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Message>((json) => Message.fromJson(json)).toList();
    }
    return null;
  }

  Future<List<Message>> getSentMessageData(userId) async {
    String url = "/sent_messages_api?userId=$userId";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Message>((json) => Message.fromJson(json)).toList();
    }
    return null;
  }

  static sendMessageToSchool(String userId, String receiverId, String title,
      String messageText) async {
    var result;
    String url = "/send_message_to_school";
    var data = {
      "senderId": userId,
      "receiverId": receiverId,
      "title": title,
      "messageText": messageText
    };
    var res = await HttpAPIManager.postWithParam(url, data, "post");

    result = res.data['senderId'];

    if (result != null) {
      return true;
    }
    return false;
  }

  Future<School> getSchoolInformation() async {
    String url = "/retrieve_about_school";
    final res = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);
    final data = res.data;
     print(data);
    if (res != null) {
     return School.fromJson(data);
    //  return data.map<School>((json) => School.fromJson(json)).toList();
    }
    return null;
  }

  static sendLeaveFormToSchool(String fromUserId, String toUserId, String studentId,
      String fromDate,String toDate,String name,String description ) async {
    var result;
    String url = "/sendLeaveForm_to_school";
    var data = {
      "fromUserId": fromUserId,
      "toUserId": toUserId,
      "studentId": studentId,
      "fromDate": fromDate,
      "toDate": toDate,
      "name": name,
      "description": description
    };
    var res = await HttpAPIManager.postWithParam(url, data, "post");

    result = res.data['senderId'];

    if (result != null) {
      return true;
    }
    return false;
  }

  Future<List<Leave>> viewLeaveData(userId,studentId) async {
    String url = "/retrieve_student_leave?userId=$userId&studentId=$studentId";
    

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<Leave>((json) => Leave.fromJson(json)).toList();
    }
    return null;
  }

  Future<StudentInfo> viewStudentInfo(studentId) async {
    String url = "/retrieve_student_info?studentId=$studentId";
    

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      //return data.map<Leave>((json) => Leave.fromJson(json)).toList();
      return StudentInfo.fromJson(data);
    }
    return null;
  }

  Future<List<StudentPayment>> viewStudentPayment(studentId) async {
    String url = "/retrieve_student_payment?studentId=$studentId";

    final response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

    final data = response.data;
    if (response != null) {
      return data.map<StudentPayment>((json) => StudentPayment.fromJson(json)).toList();
    }
    return null;
  }

}
