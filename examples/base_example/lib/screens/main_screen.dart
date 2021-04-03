import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Text('Open Details'),
              onPressed: () => context.nav.push('/details/1'),
            ),
            OutlinedButton(
              child: Text('Open Menu'),
              onPressed: () => context.nav.push('/menu/page1'),
            ),
            OutlinedButton(
              child: Text('Open Google.com'),
              onPressed: () =>
                  context.nav.pushExternal('https://www.google.com/'),
            ),
          ],
        ),
      ),
    );
  }
}
