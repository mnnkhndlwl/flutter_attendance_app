class Student {
  String? name;
  int? enrollmentNo;
  String? department;
  String? section;
  int? semester;

  Student(
      {this.name,
      this.enrollmentNo,
      this.department,
      this.section,
      this.semester});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enrollmentNo = json['enrollment_no'];
    department = json['department'];
    section = json['section'];
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enrollment_no'] = this.enrollmentNo;
    data['department'] = this.department;
    data['section'] = this.section;
    data['semester'] = this.semester;
    return data;
  }
}
