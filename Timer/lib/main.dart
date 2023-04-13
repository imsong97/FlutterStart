import 'package:flutter/material.dart';
import 'dart:async';

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
        backgroundColor: Color(0xFFFF674C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const Challenge(),
    );
  }
}

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  static const INIT_SECONDS = 0;
  static const INIT_BREAK_SECONDS = 300;

  int totalSeconds = INIT_SECONDS;
  bool isRunning = false;
  late Timer timer;
  int pomodoros = 0;
  int goal = 0;

  late final List<int> _minuteList = [15, 20, 25, 30, 35];

  bool nowBreakTime = false;
  late Timer breakTimer;
  int breakTimeSeconds = INIT_BREAK_SECONDS;

  String _formatter(int seconds) {
    return Duration(seconds: seconds).toString().split(".").first.substring(2, 7);
  }

  void _startCount() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(totalSeconds == 0) {
        pomodoros++;
        isRunning = false;
        totalSeconds = INIT_SECONDS;
        timer.cancel();
        if (pomodoros == 4) {
          pomodoros = 0;
          goal++;
        }
        _startBreakTimer();
      } else {
        totalSeconds--;
      }
      setState(() {});
    });
    setState(() {});
  }

  void _onPause() {
    timer.cancel();
    isRunning = false;
    setState(() {});
  }

  void _startBreakTimer() {
    nowBreakTime = true;
    breakTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(breakTimeSeconds == 0) {
        nowBreakTime = false;
        breakTimeSeconds = INIT_BREAK_SECONDS;
        timer.cancel();
      } else {
        breakTimeSeconds--;
      }
      setState(() {});
    });
  }

  void _showBreakTimeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Now Break Time!!'),
          content: Text('5분 휴식 후 시작하세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(_formatter(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,)
            ),
          ), flex: 3,),
          SizedBox(height: 20,),
          Flexible(child: Container(
            height: 90,
            child: ListView.builder(
              itemCount: _minuteList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(_minuteList[i].toString(), style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 60)),
                  ),
                  onTap: () {
                    if (!isRunning) {
                      totalSeconds = 10;
                      setState(() {});
                    }
                  },
                );
              }, ),
          ), flex: 1,),
          Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: (){
                    if (isRunning) {
                      _onPause();
                    } else {
                      if (nowBreakTime) {
                        _showBreakTimeDialog();
                      } else {
                        if (totalSeconds == 0) totalSeconds = _minuteList[0] * 60;
                        _startCount();
                      }
                    }
                  },
                  icon: Icon(isRunning ? Icons.pause_circle : Icons.play_circle_outline),
                ),
              ]
          ), flex: 2,),
          Flexible(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$pomodoros/4",
                        style: TextStyle(fontSize: 25, color: Color(0xFFE3E3E3), fontWeight: FontWeight.w900),),
                      SizedBox(height: 10,),
                      Text("ROUND", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$goal/12",
                        style: TextStyle(fontSize: 25, color: Color(0xFFE3E3E3), fontWeight: FontWeight.w900),),
                      SizedBox(height: 10,),
                      Text("GOAL", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900))
                    ],
                  ),
                ),
              ],
            ),
          ), flex: 1,)
        ],
      ),
    );
  }
}
