import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:projectwithsqllite/core/helper/db_helper.dart';
import 'package:projectwithsqllite/core/repositery/web_services.dart';

class StudentRepositery {
  late WebServices webServices;
  StudentRepositery({required this.webServices});

//used api//////////////
// ignore: non_constant_identifier_names
  Future<List<StudentModel>> GetAllDataApi() async {
    try {
      final studentsRespons = await webServices.GetAllDataApi();
      return studentsRespons
          .map((student) => StudentModel.fromJson(student))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> submitStudentToApi(StudentModel obj) async {
    try {
      final submitRegust = await webServices.submitStudentToApi(obj);
      return submitRegust;
    } catch (ex) {
      return false;
    }
  }

  Future<bool> updateStudentToApi(StudentModel obj) async {
    try {
      final updateRegust = await webServices.updateStudentToApi(obj);
      if (updateRegust == true) {
        print(
            "---------done update ${obj.toJson().toString()} -------------------");
        print("---------Done update:$updateRegust -------------------");
        return updateRegust;
      }

      return false;
    } catch (ex) {
      print("---------erroe update------------------${ex.toString()}");
      return false;
    }
  }

  Future<int> Delete(int id) async {
    // int res = await SQL_Helper().rawDelete(id);
    final res = await webServices.Delete(id);
    // if (res == 1) {
    //   print("Done For deleted:${res}");
    // } else if (res == 0) {
    //   print("faild For deleted");
    // }
    return res;
  }

  Future<List<StudentModel>> getAllData() async {
    await Future.delayed(const Duration(milliseconds: 5));
    final studentsRespons = await webServices.GetAllData();
    return studentsRespons
        .map((student) => StudentModel.fromJson(student))
        .toList();
  }

  Future<List<StudentModel>?> submitStudent(StudentModel obj) async {
    try {
      // await Future.delayed(const Duration(seconds: 10));
      await SQL_Helper().insert("Students", obj.toJson());
    } catch (ex) {
      return [];
    }
    return [];
  }
  //  Future<int> add(StudentModel obj) async {
  //   // await Future.delayed(const Duration(seconds: 10));
  //   var res = await SQL_Helper().insert("Students", obj.toJson());
  //   return res;
  // }

  Future<List<StudentModel>> updata(
      Map<String, dynamic> valuse, int whereByid) async {
    try {
      // await Future.delayed(const Duration(seconds: 3));
      await SQL_Helper().update("Students", valuse, whereByid);
    } catch (ex) {
      return [];
    }
    return [];
  }

  // Future<void> updatastudent(Map<String, dynamic> valuse, int whereByid) async {

  //     // await Future.delayed(const Duration(seconds: 3));
  //     await SQL_Helper().update("Students", valuse, whereByid);
  //     await getAllData();

  // }

  Future<int> rawDelete(String id) async {
    int res = await SQL_Helper().rawDelete(id);
    if (res == 1) {
      print("Done For deleted:${res}");
    } else if (res == 0) {
      print("faild For deleted");
    }
    return res;
  }
}
