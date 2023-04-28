import 'package:attendance/features/auth/screens/auth_screen.dart';
import 'package:attendance/features/auth/services/auth_service.dart';
import 'package:attendance/features/subjects/screens/subject_screen.dart';
import 'package:attendance/providers/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TeacherProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance',
      home: Provider.of<TeacherProvider>(context).teacher.token!.isNotEmpty ? SubjectScreen() : AuthScreen()
    );
  }
}