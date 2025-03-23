import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/postFeed.dart';
import 'package:my_app/screen_1.dart';
import 'package:my_app/screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: '/',
      home: Login(),
      onGenerateRoute: (settings){
        if(settings.name=='/postFeed'){
          return MaterialPageRoute(builder: (ctx)=>PostFeed());
        }
      },
      // routes: {
      //   "/": (ctx) => Login(),
      //   '/secondScreen': (ctx) => Screen1(),
      //   '/thirdScreen': (ctx) => Screen2(),
      //   '/postFeed' : (ctx) => PostFeed(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          6,
              (index) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'GridView ${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.of(context).pushNamed('/secondScreen');
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
        tooltip: "Go to Screen 1",
      ),
    );
  }
}
