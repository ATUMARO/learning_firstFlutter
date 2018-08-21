import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListActivity extends StatelessWidget {
  var index = 0;

  ListActivity(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is item $index"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
// Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
