import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_firebase/screens/error_screen.dart';
import 'package:flutter_firebase/screens/loginWithEmailAndPassword_screen.dart';
import 'package:flutter_firebase/screens/success_screen.dart';
import 'signUpWithEmailAndPassword_screen.dart';

class SiginInScreen extends StatefulWidget {
  @override
  _SiginInScreenState createState() => _SiginInScreenState();
}

class _SiginInScreenState extends State<SiginInScreen> {
  bool _error = false;
  bool _initialized = false;

  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (error) {
      print(error);
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  sigInAnonymously(BuildContext context) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    //  print(userCredential);
    if (!_initialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error) {
      Navigator.pushNamed(context, ErrorScreen.routeName);
    } else {
      Navigator.pushNamed(context, SuccessScreen.routeName);
    }
  }

  signUpWithEmailAndPassword(BuildContext context) {
    Navigator.pushNamed(context, SignUpWithEmailAndPassword.routeName);
  }

  logInWithEmailAndPassword(BuildContext context) {
    Navigator.pushNamed(context, LoginWithEmailAndPassword.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SiginCard(
            siginMethod: 'Sigin in Anounymously',
            onPressed: () {
              sigInAnonymously(context);
            },
          ),
          SizedBox(height: 20.0),
          SiginCard(
            siginMethod: 'SigUn in with Email and Password',
            onPressed: () {
              signUpWithEmailAndPassword(context);
            },
          ),
          SiginCard(
            siginMethod: 'LogIn with Email and Password',
            onPressed: () {
              logInWithEmailAndPassword(context);
            },
          ),
        ],
      ),
    );
  }
}

class SiginCard extends StatelessWidget {
  final String siginMethod;
  final Function onPressed;

  SiginCard({Key key, this.siginMethod, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(siginMethod),
          ),
        ),
      ),
    );
  }
}
