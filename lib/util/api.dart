import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpAPIManager {
// Url parameter start with /
static getWithUrl(String url,String method) async{
 
 String requestUrl = Config.BASE_URL+Config.MOBILE_API_URL+url;
 Options option = new Options();
 String token = await LocalStorage.get(Config.TOKEN_KEY);
 option.headers = {"SMSAuth": token};
 option.method = method;
 //print(requestUrl);
 var dio = new Dio();
 var response;
 try{
  response = await dio.request(requestUrl,options: option);

 } on DioError catch(e) {
   
  return null;
 }

return response;

}

// Url FormData formData = new FormData.from({"name": "wendux","age": 12})
static postWithParam(String url,var formData,String method) async{
 String requestUrl = Config.BASE_URL+Config.MOBILE_API_URL+url;
 Options option = new Options();
 String token = await LocalStorage.get(Config.TOKEN_KEY);
 option.headers = {"SMSAuth": token};
 option.method = method;

 var dio = new Dio();
 var response;
 try{
  response = await dio.post(requestUrl, data: formData,options: option);

 } on DioError catch(e) {
   Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#e74c3c",
        textcolor: '#ffffff'
   );
   //exit(0);
  return null;
 }

return response;
}

// Url FormData formData = new FormData.from({"name": "wendux","age": 12})
static postLogin(String url,var formData,String method) async{
 String requestUrl = Config.BASE_URL+url;
 Options option = new Options();
 option.method = method;

 var dio = new Dio();
 var response;
 print(requestUrl);
 try{
  response = await dio.post(requestUrl, data: formData,options: option);

 } on DioError catch(e) {
  print(e);
  return response;
 }

return response;
}

}

