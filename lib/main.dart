import 'package:challenge_infracea/pages/login/login_page.dart';
import 'package:challenge_infracea/utils/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VeppoApp());
}

class VeppoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: white,
      ),
      home: LoginPage(),
    );
  }
}
