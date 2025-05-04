
class StudentModel {
  StudentModel({
      this.id, 
      this.name, 
      this.age,});

  StudentModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }
  int? id;
  String? name;
  int? age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['age'] = age;
    return map;
  }

}