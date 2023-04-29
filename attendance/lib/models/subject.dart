// import 'dart:convert';

// class Subject {
//   String? name;
//   String? subjectid;
//   String? subImg;
//   String? department;
//   int? semester;
//   String? section;
//   String? teacherName;

//   Subject({
//     this.name,
//     this.subjectid,
//     this.subImg,
//     this.department,
//     this.semester,
//     this.section,
//     this.teacherName
//   });

//   Subject copyWith({
//     String? name,
//     String? subjectid,
//     String? subImg,
//     String? department,
//     int? semester,
//     String? section,
//     String? teacherName,
//   }) {
//     return Subject(
//       name : name ?? this.name,
//       subjectid : subjectid ?? this.subjectid,
//       subImg: subImg ?? this.subImg,
//       department: department ?? this.department,
//       semester : semester ?? this.semester,
//       section : section ?? this.section,
//       teacherName: teacherName ?? this.teacherName,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'subjectid': subjectid,
//       'subImg': subImg,
//       'department': department,
//       'semester': semester,
//       'section': section,
//       'teacherName': teacherName,
//     };
//   }

//   factory Subject.fromMap(Map<String, dynamic> map) {
//     return Subject(
//       name :map['name'],
//       subjectid: map['subjectid'],
//       subImg: map['subImg'],
//       department: map['department'],
//       semester: map['semester']?.toInt(),
//       section: map['section'],
//       teacherName: map['teacherName'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Subject(name: $name, subjectid: $subjectid, subImg: $subImg, department: $department, semester: $semester, section: $section, teacherName: $teacherName)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is Subject &&
//       other.name == name &&
//       other.subjectid == subjectid &&
//       other.subImg == subImg &&
//       other.department == department &&
//       other.semester == semester &&
//       other.section == section &&
//       other.teacherName == teacherName;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//       subjectid.hashCode ^
//       subImg.hashCode ^
//       department.hashCode ^
//       semester.hashCode ^
//       section.hashCode ^
//       teacherName.hashCode;
//   }
// }

class Subject {
  String? name;
  String? subjectid;
  String? subImg;
  String? department;
  int? semester;
  String? section;
  String? teacherName;

  Subject(
      {this.name,
      this.subjectid,
      this.subImg,
      this.department,
      this.semester,
      this.section,
      this.teacherName});

  Subject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subjectid = json['subjectid'];
    subImg = json['subImg'];
    department = json['department'];
    semester = json['semester'];
    section = json['section'];
    teacherName = json['teacherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subjectid'] = this.subjectid;
    data['subImg'] = this.subImg;
    data['department'] = this.department;
    data['semester'] = this.semester;
    data['section'] = this.section;
    data['teacherName'] = this.teacherName;
    return data;
  }
}
