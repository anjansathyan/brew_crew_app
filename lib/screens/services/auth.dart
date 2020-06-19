import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on Firebase User
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in for anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailandPassword(String email, String password) async{
    try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
  }
  }

  //register with new email address
  Future registerWithEmailandPassword(String email, String password) async{
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    
  //create a new document with uid
    await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
    return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
  }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}