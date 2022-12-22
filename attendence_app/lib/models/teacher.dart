import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Teacher {
  final String teacherName;
  final String email;
  final String password;
  final String department;
 
 Teacher({
    required this.teacherName,
    required this.email,
    required this.password,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    return {
      'teacherName': teacherName,
      'email': email,
      'password': password,
      'department': department,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      teacherName: map['teacherName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      department: map['department'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) => Teacher.fromMap(json.decode(source));

}



