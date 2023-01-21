import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/CardView.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TITLE Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Hey, Ch0pp4", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
                      Text("Welcome back", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),)
                    ],)
                ],
              ),
              SizedBox(height: 120,),
              Text(
                "Total Balance",
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 22),
              ),
              SizedBox(height: 10,),
              const Text(
                "\$5 194 482",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  expandedButton(radiusButton("Transfer", Colors.amber)),
                  SizedBox(width: 20,),
                  expandedButton(radiusButton("Request", const Color(0xFF1F2123), textColor: Colors.white))
                ],
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("Wallets", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w600),),
                  Text("View All", style: TextStyle(color: Colors.white, fontSize: 18),)
                ],
              ),
              SizedBox(height: 20,),
              CardView(money: "Euro", property: "6 428", unit: "EUR", backgroundColor: Color(0xFF1F2123),contentColor: Colors.white),
              Transform.translate(offset: Offset(0, -20), child: CardView(money: "Dollar", property: "6 428", unit: "USA", backgroundColor: Colors.white, contentColor: Color(0xFF1F2123))),
              Transform.translate(offset: Offset(0, -40), child: CardView(money: "Bitcoin", property: "6 428", unit: "BTC", backgroundColor: Color(0xFF1F2123), contentColor: Colors.white))
            ],
          ),
        ),
      )
    );
  }
}

Expanded expandedButton(Container containerChild) {
  return Expanded(child: containerChild, flex: 1,);
}

Container radiusButton(String text, Color backgroundColor, {Color? textColor}) {
  return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(45)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16,), textAlign: TextAlign.center,),
      )
  );
}

