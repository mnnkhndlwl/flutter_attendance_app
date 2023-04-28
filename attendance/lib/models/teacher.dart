import 'dart:convert';

class Teacher {
  String? token;
  String? teacherName;
  String? email;
  String? department;

  Teacher({
    this.token,
    this.teacherName,
    this.email,
    this.department
  });

  Teacher copyWith({
    String? token,
    String? teacherName,
    String? email,
    String? department,
  }) {
    return Teacher(
      token: token ?? this.token,
      teacherName: teacherName ?? this.teacherName,
      email: email ?? this.email,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'teacherName': teacherName,
      'email': email,
      'department': department,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      token: map['token'],
      teacherName: map['teacherName'],
      email: map['email'],
      department: map['department'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) => Teacher.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Teacher(token: $token, teacherName: $teacherName, email: $email, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Teacher &&
      other.token == token &&
      other.teacherName == teacherName &&
      other.email == email &&
      other.department == department;
  }

  @override
  int get hashCode {
    return token.hashCode ^
      teacherName.hashCode ^
      email.hashCode ^
      department.hashCode;
  }
}
