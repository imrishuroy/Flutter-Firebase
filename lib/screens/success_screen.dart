import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = 'success-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Screen'),
      ),
      body: Center(
        child: Text(
          'Successfull',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
