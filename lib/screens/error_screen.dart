import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static String routeName = 'error-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Screen'),
      ),
      body: Center(
        child: Text(
          'Something went wrong',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
