import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/views/tasks_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF2c3e50),
          accentColor: Color(0xFF1abc9c),
          textTheme: TextTheme(
            body1: TextStyle(
              color: Color(0xFFecf0f1),
            ),
          ),
        ),
        home: TasksView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
