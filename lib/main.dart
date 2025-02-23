
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //

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

  TextEditingController taskController = TextEditingController();

  var tasks = [];

  _addTask(){
  String taskText = taskController.text.trim();
    if(taskText.isNotEmpty) {
      setState(() {
        tasks.add({
          'id': tasks.length + 1,
          'text': taskController.text
        });
      });

      taskController.clear();
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color(0xFF280003),
        title: Text(widget.title,style: GoogleFonts.roboto(color: Colors.white,fontSize: 30),),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.deepOrange,
          child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              // color: Colors.white,
              height: 450,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: ListView(
                children: List.generate(
                  tasks.reversed.toList().length,
                    (index){
                    var task = tasks.reversed.toList()[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // Shadow color
                                spreadRadius: 1,  // Spread radius
                                blurRadius: 3,    // Blur effect
                                offset: Offset(0, 3), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          // color: Colors.grey,
                          width: double.infinity,
                          // padding: EdgeInsets.all(5.0),
                          child: Text(
                            task['text'].toString(),
                            style: TextStyle(
                                // backgroundColor: Colors.cyanAccent,
                                color: Colors.black,fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 10), // 10 পিক্সেল গ্যাপ
                      ],
                    );
                    }

                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom:0,
                    left: 4,
                    right: 4,
                    child: Container(
                      // color: Colors.grey,
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: taskController,
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
                              onPressed: _addTask,
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
