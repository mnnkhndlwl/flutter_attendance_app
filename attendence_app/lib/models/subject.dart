import 'dart:convert';

class Subject {
   String? name;
   String? subjecctid;
   String? subImg;
   String? department;
   int? semester;
   String? section;
   String? teacherName;

  Subject(
     {this.name,
     this.subjecctid,
     this.subImg,
     this.department,
     this.semester,
     this.section,
     this.teacherName,}
  );


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subjecctid': subjecctid,
      'subImg': subImg,
      'department': department,
      'semester': semester,
      'section': section,
      'teacherName': teacherName,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      subjecctid: map['subjecctid'],
      subImg: map['subImg'],
      department: map['department'],
      semester: map['semester']?.toInt(),
      section: map['section'],
      teacherName: map['teacherName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source));
}
