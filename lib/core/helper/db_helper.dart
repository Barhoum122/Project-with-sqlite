import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// ignore: camel_case_types
class SQL_Helper {
  static SQL_Helper? dbHelper;
  static Database? _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    dbHelper ??= SQL_Helper._createInstance();
    return dbHelper as SQL_Helper;
  }

  Future<Database> get database async {
    _database ??= await initializedDatabase();
    return _database as Database;
  }

  Future<Database> initializedDatabase() async {
    int dbver = 1;
    // Android/data/project_name/files
    final dbFolder = await getExternalStorageDirectory();

    // Android/data/project_name/files/Database
    final dbPath = p.join(dbFolder!.path, "Database");

    Directory dbFolderDir = await Directory(dbPath).create();

    // Android/data/project_name/files/Database/school.db
    final file = File(p.join(dbFolderDir.path, 'school.db'));
    var schoolDB = await openDatabase(
      file.path,
      version: dbver,
      onCreate: createDatabase,
      //onUpgrade: upgradeDatabase,
      //onDowngrade: downgradeDatabase
    );
    return schoolDB;
  }

  // List<Map<String, dynamic>> tablesNameList = [
  //   {'name': 'Doctor' ,
  //     'sql': 'CREATE TABLE Doctor(Id INTEGER PRIMARY KEY, Name TEXT, Img TEXT, DeptId INTEGER)'
  //   },

  //   {'name': 'Drugs' ,
  //     'sql': 'CREATE TABLE Drugs(Id INTEGER PRIMARY KEY, Name TEXT,className TEXT, Price INTEGER)'
  //   },

  //   {'name': 'Depts' ,
  //     'sql': 'CREATE TABLE Depts(Id INTEGER PRIMARY KEY, Name TEXT)'
  //   }
  // ];

  String studentTbl =
      'CREATE TABLE Students(Id INTEGER PRIMARY KEY, Name TEXT, Age INTEGER)';
  String teacherTbl =
      'CREATE TABLE Teachers(Id INTEGER PRIMARY KEY, Name TEXT, Salary REAL, Details TEXT)';
  String subjectTbl =
      'CREATE TABLE Subjects(Id INTEGER PRIMARY KEY, Name TEXT, TeacherId INTEGER, Details TEXT)';

  void createDatabase(Database db, int version) async {
    try {
      await db.execute(studentTbl);
      await db.execute(teacherTbl);
      await db.execute(subjectTbl);
      /*for (int i = 0; i < tablesNameList.length; i++) {
        await db.execute(tablesNameList[i]["sql"]);
      }*/
    } catch (e) {
      print("Create Exp:- $e");
    }
  }

  void upgradeDatabase(Database db, oldVersion, newVersion) async {
    if (oldVersion < newVersion) {
      // await db.execute(sql)
    }
  }

  void downgradeDatabase(db, oldVersion, newVersion) async {
    if (oldVersion >= newVersion) {
      try {} catch (e) {
        print("CreateExp:- $e");
      }
    }
  }

  // Future<int> insertStudent(StudentModel obj) async {
  //   Database db = await database;
  //   var res = await db.insert("Students", obj.toJson());
  //   return res;
  // }

  Future<int> insert(String tbl, Map<String, dynamic> obj) async {
   
      Database db = await database;
      var re = await db.insert(tbl, obj,
          conflictAlgorithm: ConflictAlgorithm.ignore);
      return re;
  }

//  void editTask(String id, String newTitle, String newDescription) async{
//     final taskIndex = await db.indexWhere((task) => task.id == id);
//     if (taskIndex >= 0) {
//       _tasks[taskIndex] = Task(id: id, title: newTitle, description: newDescription);
//      // notifyListeners();
//     }
//   }

  // Future<int> update(String tbl, Map<String, dynamic> valuse, int id) async {
  //   Database db = await database;
  //   var res = await db.update(tbl, valuse, where: 'Id = ?', whereArgs: [id]);

  //   return res;
  //   // try {
  //   //   Database db = await database;
  //   //   var res = await db.update(tbl, valuse,
  //   //       where: whereByid);

  //   //   return res;
  //   // } on Exception catch (e) {
  //   //   print("EXP in Update : $e");

  //   // }
  // }

  Future<int> update(
      String tbl, Map<String, dynamic> valuse, int whereByid) async {
    Database db = await database;
    int res =
        await db.update(tbl, valuse, where: 'Id = ?', whereArgs: [whereByid]);
    if (res == 1) {
      print("Done For update:${res}");
    } else if (res == 0) {
      print("faild For update");
    }
    return res;
  }

  // Future<List<dynamic>> updatee(String tbl,obj) async {
  //   try {
  //     Database db = await database;
  //     var res = await db.rawUpdate( );
  //     return [];
  //   } on Exception catch (e) {
  //     print("EXP in Update : $e");
  //     return [];
  //   }
  // }

  Future<int> rawDelete(String id) async {
    // ignore: unnecessary_brace_in_string_interps
    Database db = await database;
    int count = await db.rawDelete('DELETE FROM Students WHERE Id = $id');
    return count;
  }

  Future<List<Map<String, dynamic>>> getAll(String tbl) async {
    await Future.delayed(const Duration(milliseconds: 100));
    Database db = await database;
    var res = await db.query(tbl);
    return res;
  }
}
