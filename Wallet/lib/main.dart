import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
  late final List<String> _dateList = [];
  late int _nowDate;
  late int _nowWeekDay;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    _nowDate = now.day;
    _nowWeekDay = now.weekday;

    _dateList.add("TODAY");
    for(int i = _nowDate + 1; i < 31; i++) {
      _dateList.add("$i");
    }
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
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  CircleAvatar(radius: 30, backgroundImage: AssetImage(''),),
                  Icon(Icons.add, color: Colors.white, size: 50,)
                ],
              ),
              SizedBox(height: 50,),
              Text(
                _getTodayDate(),
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 22),
              ),
              SizedBox(height: 10,),
              Container(
                height: 90,
                child: ListView.builder(
                  itemCount: _dateList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(left: i == 0 ? 0 : 10, top: 10, right: 10, bottom: 0),
                      child: Text(_dateList[i], style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 52)),
                    );
                }, ),
              ),
              SizedBox(height: 20,),
              CardView(bigTitle: "DESIGN\nMETTING", startHour: "11", endHour: "12", backgroundColor: Colors.yellow, contentColor: Colors.black, startMin: "30", endMin: "20",),
              SizedBox(height: 7,),
              CardView(bigTitle: "DAILY\nPROJECT", startHour: "12", endHour: "14", backgroundColor: Color(0xFF81498B), contentColor: Colors.black, startMin: "35", endMin: "10"),
              SizedBox(height: 7,),
              CardView(bigTitle: "WEEKLY\nPLANNING", startHour: "15", endHour: "16", backgroundColor: Colors.green, contentColor: Colors.black, startMin: "00", endMin: "30")
            ],
          ),
        ),
      )
    );
  }

  String _getTodayDate() {
    List<String> daysOfWeek = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY'];
    return "${daysOfWeek[_nowWeekDay]} $_nowDate";
  }
}

class CardView extends StatelessWidget {
  final String bigTitle, startHour, endHour, startMin, endMin;
  final Color backgroundColor, contentColor;

  const CardView({
    required this.bigTitle,
    required this.startHour,
    required this.endHour,
    required this.backgroundColor,
    required this.contentColor,
    required this.startMin,
    required this.endMin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _customHourText(startHour, 20),
                  _customHourText(startMin, 10),
                  Icon(Icons.more_vert, size: 30,),
                  _customHourText(endHour, 20),
                  _customHourText(endMin, 10)
                ]
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bigTitle, style: TextStyle(color: contentColor, fontSize: 45, fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        "ALEX",
                        style: TextStyle(color: Colors.grey, fontSize: 20, ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "HELENA",
                        style: TextStyle(color: Colors.grey, fontSize: 20, ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "NANA",
                        style: TextStyle(color: Colors.grey, fontSize: 20, ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _customHourText(String txt, double size) {
    return Text(txt, style: TextStyle(color: contentColor, fontSize: size),);
  }
}

