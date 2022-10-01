import 'package:flutter/material.dart';

import 'screens/feed_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Feed UI Redesign',
      debugShowCheckedModeBanner: false,
      home: FeedScreen(),
    );
  }
}
