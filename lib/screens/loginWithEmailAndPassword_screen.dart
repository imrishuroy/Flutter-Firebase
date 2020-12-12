import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/success_screen.dart';
import 'package:flutter_firebase/widgets/show_alert.dart';

class LoginWithEmailAndPassword extends StatelessWidget {
  static String routeName = 'LoginWithEmailAndPassword';

  loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, SuccessScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showAlertDialog(
          content: 'No User Found with this email',
          title: 'No User Found',
          context: context,
          defaultActionText: 'OK',
        );
      } else if (e.code == 'wrong-password') {
        showAlertDialog(
          content: 'You have entered the wrong password',
          title: 'Wrong Password',
          context: context,
          defaultActionText: 'OK',
        );
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 200.0,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  print(_email.text);
                  print(_password.text);
                  loginWithEmailAndPassword(
                      context, _email.text, _password.text);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
