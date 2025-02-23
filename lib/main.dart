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
  int _counter = 2;

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
              height: 550,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: ListView(
                children: List.generate(_counter,(index)=>Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      padding: EdgeInsets.all(5.0),
                      child: Text("data ${index + 1}",style: TextStyle(backgroundColor: Colors.cyanAccent,color: Colors.black,fontSize: 25),),
                    ),
                    SizedBox(height: 10), // 10 পিক্সেল গ্যাপ
                  ],
                )).reversed.toList()
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom:0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.grey,
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 30.0,top: 15.0,bottom: 15.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter a task'
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Adjust padding
                              ),
                              onPressed: (){
                                setState(() {
                                  _counter++;
                                });
                              },
                              child: Icon(Icons.add,size: 30,)
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        ),
      ),

    );
  }
}
