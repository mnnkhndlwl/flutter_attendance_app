import 'dart:convert';

class Student {
   String? name;
   BigInt? enrollment_no;
   String? department;
   String? section;
   int? semester;

  Student(
     {this.name,
     this.enrollment_no,
     this.department,
     this.semester,
     this.section,}
  );


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'enrollenrollment_no':enrollment_no,
      'department': department,
      'semester': semester,
      'section': section,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      enrollment_no: BigInt.from(map['enrollment_no']),
      department: map['department'],
      semester: map['semester']?.toInt(),
      section: map['section']
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));
}
