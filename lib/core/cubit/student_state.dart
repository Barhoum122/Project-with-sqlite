part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

// ignore: must_be_immutable
class StudentLoaded extends StudentState {
  late List<StudentModel> studentItem;

  StudentLoaded(this.studentItem);
}

class StudentLoading extends StudentState {}

class Error extends StudentState {
  late final String error;
  Error({required this.error});
}

class UpdateLoading extends StudentState {}

// ignore: must_be_immutable
class Submiting extends StudentState {}
class Submited extends StudentState {}


// ignore: must_be_immutable, camel_case_types
class updataData extends StudentState {}

// ignore: must_be_immutable
class Deleted extends StudentState {
  late int delete;

  Deleted(this.delete);
}
