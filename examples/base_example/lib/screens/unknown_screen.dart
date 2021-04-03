import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unknown Screen')),
      body: Center(
        child: Icon(CupertinoIcons.question, size: 34),
      ),
    );
  }
}
