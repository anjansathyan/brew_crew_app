import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authentication/authentication.dart';
import 'package:brew_crew/screens/home/wrapper.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}