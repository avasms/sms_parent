import 'package:sms_parent/util/localStorage.dart';
import 'package:sms_parent/util/config.dart';
import 'package:sms_parent/models/user.dart';
import 'package:sms_parent/util/api.dart';
import 'package:sms_parent/util/dbhelper.dart';
import 'package:onesignal/onesignal.dart';


class AuthManager{
  
  static clearAuthorization() {    
    LocalStorage.remove(Config.TOKEN_KEY);
  }
  
  static login(String username,String password) async {
   var status = await OneSignal.shared.getPermissionSubscriptionState();
    print(status.subscriptionStatus.userId);
  String _oneSignalId = status.subscriptionStatus.userId;
  print('Hello APO$_oneSignalId');

   // String url = "/student_data_list/5";
    //var rs = await HttpAPIManager.getWithUrl(url, Config.REQUEST_GET);
   // print(rs.data);
    String loginURL = "/apilogin/mobile_parent_login";

   var data = {
   "userName": username,
   "password": password,
   "oneSignalId": _oneSignalId,
    };
   // print(data);
   var response = await HttpAPIManager.postLogin(loginURL, data, Config.REQUEST_POST);
  if(response == null){
    return response;
  }
  print(response.data);
  //Map userMap = json.decode(response.data["data"]);
  //var user = User.fromJson(userMap);
  //print('Howdy, ${user.tokenId}');
 // print(response.data['tokenId'].toString());
  var db = new DBHelper();
  await LocalStorage.save(Config.TOKEN_KEY, response.data['tokenId'].toString());
  await LocalStorage.save(Config.USER_ID, response.data['id'].toString());
  await LocalStorage.save(Config.USER_RELATED_ID, response.data['userRelatedId'].toString());
  var user = new User(null, null, null, response.data['tokenId'].toString(),response.data['id'].toString(),response.data['userRelatedId'].toString());
  db.saveUserInfo(user);

  return response;

}
 
}