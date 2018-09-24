import 'dart:async';
import 'dart:convert';
import 'package:sms_parent/models/dormitory.dart';
import 'package:flutter/foundation.dart';
import 'package:sms_parent/util/api.dart';
import 'package:sms_parent/util/config.dart';

class ApiCommonDao{
Future<List<Dormitory>> fetchPhotos() async {
  String url = "/transport_data_list";
  
  var response = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.data);
}

// A function that will convert a response body into a List<Photo>
List<Dormitory> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Dormitory>((json) => Dormitory.fromJson(json)).toList();
}


}