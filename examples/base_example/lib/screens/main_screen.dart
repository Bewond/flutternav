import 'package:flutter/material.dart';
import 'package:flutternav/flutternav.dart';

import 'package:navigator_example/paths.dart';

//

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Router Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main Router Screen'),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Open Details'),
              onPressed: () {
                NavManager.of(context).push(DetailsPath(id: 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}
