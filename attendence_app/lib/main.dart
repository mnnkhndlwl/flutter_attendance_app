import 'package:attendence_app/providers/teacher_provider.dart';
import 'package:attendence_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TeacherProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<TeacherProvider>(context).teacher.teacherName.isEmpty ? LoginPage() : const HomeScreen(),
    );
  }
}
