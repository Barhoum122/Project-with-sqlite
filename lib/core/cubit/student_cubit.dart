import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projectwithsqllite/core/Model/StudentModel.dart';
import 'package:projectwithsqllite/core/repositery/student_repositery.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepositery _studentRepositery;

  StudentCubit(this._studentRepositery) : super(StudentInitial());

  late List<StudentModel> studentItem = [];
  late bool submit;
  late bool updated = true;
  late int delete = 0;

  // ignore: non_constant_identifier_names
  List<StudentModel> GetAllDataApi() {
    try {
      emit(StudentLoading());
      _studentRepositery.GetAllDataApi().then((studentItem) {
        emit(StudentLoaded(studentItem));
        this.studentItem = studentItem;
      });
      return studentItem;
    } catch (e) {
      emit(Error(error: e.toString()));
    }
    // return [];
    return studentItem;
  }

  // ignore: non_constant_identifier_names
  List<StudentModel> GetAllData() {
    try {
      emit(StudentLoading());
      _studentRepositery.getAllData().then((studentItem) {
        emit(StudentLoaded(studentItem));
        this.studentItem = studentItem;
      });
      return studentItem;
    } catch (e) {
      emit(Error(error: e.toString()));
    }
    // return [];
    return studentItem;
  }

  void submitStudentToApi(StudentModel obj) {
    try {
      emit(Submiting());
      _studentRepositery.submitStudentToApi(obj).then((submit) {
        emit(Submited());
        // if (submit == true) {
        //   emit(Submiting());
        //   GetAllDataApi();
        // } else {
        //   emit(Error(error: "erroe Insert"));
        // }
      });
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  void updateStudentToApi(StudentModel obj) {
    try {
      _studentRepositery.updateStudentToApi(obj).then((update) {
        if (update == true) {
          emit(updataData());
          updated = update;
          GetAllDataApi();
        } else {
          emit(Error(error: "error update"));
        }
        // updated = true;
      });
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  void rawDelete(int id) {
    try {
      _studentRepositery.Delete(id).then((delete) {
        emit(Deleted(delete));
        this.delete = delete;
        GetAllDataApi();
      });
      // ignore: avoid_print
      print("---------Done delete:$delete -------------------");
    } catch (e) {
      emit(Error(error: e.toString()));
      print("---------error delete------------------${e.toString()}");
    }
  }
  // List updata(Map<String, dynamic> valuse, int whereByid) {
  //   try {
  //     _studentRepositery.updata(valuse, whereByid).then((update) {
  //       emit(updataData(update));
  //       this.update = update;
  //     });
  //     print("---------Done update:$update -------------------");
  //   } catch (e) {
  //     emit(Error(error: e.toString()));
  //     print("---------erroe update------------------${e.toString()}");
  //   }
  //   return update;
  // }

  // ignore: non_constant_identifier_names
  // int rawDelete(String id) {
  //   try {
  //     _studentRepositery.rawDelete(id).then((delete) {
  //       emit(Delete(delete));
  //       this.delete = delete;
  //     });
  //     // ignore: avoid_print
  //     print("---------Done delete:$delete -------------------");
  //     return delete;
  //   } catch (e) {
  //     emit(Error(error: e.toString()));
  //     print("---------error delete------------------${e.toString()}");
  //   }
  //   // return [];
  //   return delete;
  // }
}
