import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Icon(Icons.arrow_back),
            tooltip: "Go Back",
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/thirdScreen');
            },
            child: Icon(Icons.arrow_forward),
            tooltip: "Next Page",
          ),
        ],
      ),
    );
  }
}
