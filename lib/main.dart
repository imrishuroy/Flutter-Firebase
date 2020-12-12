import 'package:flutter/material.dart';

import 'package:flutter_firebase/screens/error_screen.dart';
import 'package:flutter_firebase/screens/loginWithEmailAndPassword_screen.dart';
import 'package:flutter_firebase/screens/signUpWithEmailAndPassword_screen.dart';
import 'package:flutter_firebase/screens/sigin_screen.dart';
import 'package:flutter_firebase/screens/success_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SiginInScreen(),
      routes: {
        SuccessScreen.routeName: (ctx) => SuccessScreen(),
        ErrorScreen.routeName: (ctx) => ErrorScreen(),
        SignUpWithEmailAndPassword.routeName: (ctx) =>
            SignUpWithEmailAndPassword(),
        LoginWithEmailAndPassword.routeName: (ctx) =>
            LoginWithEmailAndPassword(),
      },
    );
  }
}
// with help of future builder
/*
class HomeScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return SuccessScreen();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
*/
