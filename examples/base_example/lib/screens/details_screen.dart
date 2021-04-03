import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = int.tryParse(context.nav.pathData['id'] ?? '0') ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Details $id')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$id'),
            SizedBox(height: 20),
            OutlinedButton(
              child: Text('Open Details'),
              onPressed: () => context.nav.push('/details/${id + 1}'),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              child: Text('Return to home'),
              onPressed: () => context.nav.push('/'),
            ),
          ],
        ),
      ),
    );
  }
}
