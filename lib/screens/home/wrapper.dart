import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
     if(user == null){
       return Authenticate();
     }else{
       return Home();
     }
  }
}