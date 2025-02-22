import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Add a To-do'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.deepOrange,
          child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(

              color: Colors.white,
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: ListView(
                children: List.generate(3,(index)=>Column(
                  children: [
                    Text("data ${index + 1}"),
                    SizedBox(height: 10), // 10 পিক্সেল গ্যাপ
                  ],
                ))
              ),
            )

          ],
        ),
        ),
      ),

    );
  }
}
