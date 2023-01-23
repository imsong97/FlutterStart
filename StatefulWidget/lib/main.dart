import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.green, fontWeight: FontWeight.w600
          )
        )
      ),
      home: const MyHomePage(title: 'Stateful Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool counterIsWarning = false;

  void _incrementCounter() {
    // setState(() {
    //   _counter++;
    //   if (_counter > -5) {
    //     counterIsWarning = false;
    //   }
    // });
    // or
    _counter++;
    if (_counter > -4) {
      counterIsWarning = false;
    }
    setState(() {}); // rebuild -> call build(context) method
  }

  void decrementCounter() {
    setState(() {
      _counter--;
      if (_counter < -4) {
        counterIsWarning = true;
      }
    });
  }

  void refreshCounter() {
    setState(() {
      _counter = 0;
      counterIsWarning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.subtitle1, // access parent's theme
              ),
              Text(
                '$_counter',
                style: TextStyle(color: counterIsWarning ? Colors.red : Colors.grey, fontSize: 30),
              ),
              IconButton(onPressed: _incrementCounter, icon: Icon(Icons.add_circle), iconSize: 50),
              IconButton(onPressed: decrementCounter, icon: Icon(Icons.remove_circle), iconSize: 50,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: refreshCounter,
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
