import 'package:dio/dio.dart';
import 'package:projectwithsqllite/core/helper/db_helper.dart';

import '../Model/StudentModel.dart';

class WebServices {
  final baseUrl = "http://localhost:5286/api/";
  late Dio dio;
  late SQL_Helper sql_helper;
  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
      receiveDataWhenStatusError: true,
      // connectTimeout: 20 * 1000, // 60 seconds,
      // receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

//used apis in this section...............

  // ignore: non_constant_identifier_names
  Future<List<dynamic>> GetAllDataApi() async {
    try {
      Response response = await dio.get('Student');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> submitStudentToApi(StudentModel obj) async {
    try {
      final response = await dio.post('Student', data: obj.toJson());
      // print(response.data.toString());
      return response.data as bool;
    } catch (e) {
      //print(e.toString());
      return false;
      // rethrow;
    }
  }

  Future<bool> updateStudentToApi(
    StudentModel obj,
  ) async {
    try {
      // await Future.delayed(Duration(seconds: 2));
      final response = await dio.put('Student/${obj.id}', data: obj.toJson());
      // print(response.data.toString());
      return response.data as bool;
    } catch (e) {
      //print(e.toString());
      return false;
    }
  }

  Future<int> Delete(int id) async {
    try {
      final response = await dio.delete('Student/$id');
      // print(response.data.toString());
      return response.data as int;
    } catch (e) {
      //print(e.toString());
      return 0;
    }
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

  // ignore: non_constant_identifier_names
  Future<List<dynamic>> GetAllData() async {
    try {
      var res = await SQL_Helper().getAll('Students');

      return res;
    } catch (exp) {
      print("Error accuard in clacc WebServer:>>${exp.toString()}");
      return [];
    }
  }

  //  Future<dynamic> add(StudentModel obj)async {
  //    // TODO: implement add
  //      var addRes = await sql_helper.insert("Students", obj.toJson());
  //  }

// Future<bool> AddStudent(StudentModel obj)async{
//     try{
//      await Future.delayed(Duration(seconds: 1));
//       var addRes = await sql_helper.insert("Students", obj.toJson());
//       if(addRes > 0){
//         return true;

//       }
//       else{
//         return false;
//       }
//     }
//     catch(ex){
//       rethrow;
//     }
//   }

  // ignore: non_constant_identifier_names
  // Future<List<dynamic>> GetAllDataProducts() async {
  //   try {
  //     Response response = await dio.get('carts');
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }
}
