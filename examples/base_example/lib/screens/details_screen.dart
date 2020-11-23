import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

import 'package:navigator_example/paths.dart';

//

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details $id'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$id',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Open Details'),
              onPressed: () {
                NavManager.of(context).push(DetailsPath(id: id + 1));
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Reset to home'),
              onPressed: () {
                NavManager.of(context).revert(StartPath());
              },
            ),
          ],
        ),
      ),
    );
  }
}
