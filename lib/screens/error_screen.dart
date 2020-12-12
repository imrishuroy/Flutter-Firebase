import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
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
