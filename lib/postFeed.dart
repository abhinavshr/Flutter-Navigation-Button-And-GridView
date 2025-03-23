import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostFeed extends StatelessWidget {
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostFeed',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PostFeed'),
          centerTitle: true,
        ),
        body: const Padding(
            padding: EdgeInsets.all(16.0),
          child: MyPostFeed(),
        ),
      ),
    );
  }
}

class MyPostFeed extends StatefulWidget {
  const MyPostFeed({super.key});

  @override
  _MyPostFeedState createState() => _MyPostFeedState();
}

class _MyPostFeedState extends State<MyPostFeed>{
  @override
  Widget build(BuildContext context) {
    return Text('hello');
  }
}
