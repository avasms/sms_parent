import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';

class AuthManager{
  static isLogined()async {
  var token = await LocalStorage.get(Config.TOKEN_KEY);
  if(token !=null){
  return true;
  }else
  {
  return false;
  }
}
}