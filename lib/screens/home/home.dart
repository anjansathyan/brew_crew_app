import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm()
          );
      });
    }
    
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
         backgroundColor: Colors.brown[400],
         title: Text('Brew Crew'),
         elevation: 0.0,
         actions: <Widget>[
           FlatButton.icon(
             icon: Icon(Icons.person), 
             label: Text('logout'),
             onPressed: () async {
               await _auth.signOut();
             },
           ),
           FlatButton.icon(
             icon: Icon(Icons.settings),
            label: Text('settings'),
            onPressed: () => _showSettingsPanel(),
            )
           ],
        ),
        body: Container(
          decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/coffee_bg.png'),
             fit: BoxFit.cover
             ) 
          ),
          child: BrewList()),
      ),
    );
    
  }
}