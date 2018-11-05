import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sms_parent/models/user.dart';

class DBHelper {
  static Database _db;


  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "avasms.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE ParentInfo(id INTEGER PRIMARY KEY, userId TEXT, parentId TEXT, token TEXT, displayName TEXT, firebaseToken TEXT )");
    print("Created tables");
  }

   Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("ParentInfo");
    print(res.length);
    return res.length > 0? true: false;
  }

  void saveUserInfo(User user) async {
    print(user);
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      String query = 'INSERT INTO ParentInfo(userId,parentId,token) VALUES (\"'+
          user.userId
          +'\",\"'+
          user.parentId
          +'\",\"'+
          user.tokenId
          +'\")';
          print(query);
      return await txn.rawInsert(query);
    });
  }

Future<int> getCount() async {
    var dbClient = await db;
   // return  await Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM ParentInfo'));
   var res = Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM ParentInfo'));
    return res;
  }
}