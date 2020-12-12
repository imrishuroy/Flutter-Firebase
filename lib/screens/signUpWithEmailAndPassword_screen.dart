import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/error_screen.dart';
import 'package:flutter_firebase/screens/success_screen.dart';
import 'package:flutter_firebase/widgets/show_alert.dart';

class SignUpWithEmailAndPassword extends StatelessWidget {
  static String routeName = 'SiginWithEmailAndPassword';

  signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      Navigator.pushNamed(context, SuccessScreen.routeName);
    } on FirebaseAuthException catch (error) {
      //Navigator.pushNamed(context, ErrorScreen.routeName);
      if (error.code == 'weak-password') {
        print('Password is too weak');
        showAlertDialog(
          context: context,
          title: 'Password is to weak',
          content: 'Use a stronger password',
          defaultActionText: 'OK',
        );
      } else if (error.code == 'email-already-in-use') {
        showAlertDialog(
          context: context,
          title: 'Email Already In Use',
          content: 'Create a different Account Or Login With This Email',
          defaultActionText: 'OK',
        );
        print('The account already exists for that email.');
      }
    } catch (error) {
      print(error);
      Navigator.pushNamed(context, ErrorScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                signUpWithEmailAndPassword(
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
    );
  }
}
