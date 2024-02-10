import 'package:mentor_program/common/models/mentor.dart';

class Course {
  Course({
    required this.id,
    required this.name,
    required this.isFree,
    required this.description,
    required this.mentor,
  });
  late final int id;
  late final String name;
  late final bool isFree;
  late final String description;
  late final Mentor mentor;
  
  Course.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    isFree = json['isFree'];
    description = json['description'];
    mentor = Mentor.fromJson(json['mentor']); 
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['isFree'] = isFree;
    _data['description'] = description;
    _data['mentor'] = mentor;
    return _data;
  }
}