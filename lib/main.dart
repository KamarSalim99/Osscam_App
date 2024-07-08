import 'package:flutter/material.dart';
import 'package:project_state_mangment/view/creat_or_join_page.dart';
import 'package:project_state_mangment/view/create_project_page.dart';
import 'package:project_state_mangment/view/project_page.dart';
import 'package:project_state_mangment/view/signup_page.dart';
import 'package:project_state_mangment/view/login_page.dart';

import 'core/config/hive_init_config.dart';
import 'service/auth_service.dart';
import 'view/tasks_page.dart';

void main(List<String> args) {
  openHive();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:(box?.get('token')==null)?SignupPage():LoginPage()
    );
  }
}