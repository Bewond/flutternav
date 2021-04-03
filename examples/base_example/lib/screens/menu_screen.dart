import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

class MenuScreen extends StatelessWidget {
  final Widget page;

  const MenuScreen({required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => context.nav.push('/menu/page1'),
                  child: Text('Tab1'),
                ),
                OutlinedButton(
                  onPressed: () => context.nav.push('/menu/page2'),
                  child: Text('Tab2'),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: page,
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('1'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Text('2'),
    );
  }
}
