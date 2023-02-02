import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const INIT_SECONDS = 10;

  int totalSeconds = INIT_SECONDS;
  bool isRunning = false;
  late Timer timer;
  int pomodoros = 0;

  String formatter(int seconds) {
    return Duration(seconds: seconds).toString().split(".").first.substring(2, 7);
  }

  void startCount() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(totalSeconds == 0) {
        pomodoros++;
        isRunning = false;
        totalSeconds = INIT_SECONDS;
        timer.cancel();
      } else {
        totalSeconds--;
      }
      setState(() {});
    });
    setState(() {});
  }

  void onPause() {
    timer.cancel();
    isRunning = false;
    setState(() {});
  }

  void reset() {
    isRunning = false;
    timer.cancel();
    totalSeconds = INIT_SECONDS;
    pomodoros = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(formatter(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,)
            ),
          ), flex: 1,),
          Flexible(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPause : startCount,
                icon: Icon(isRunning ? Icons.pause_circle : Icons.play_circle_outline),
              ),
              IconButton(
                iconSize: 50,
                color: Theme.of(context).cardColor,
                onPressed: reset,
                icon: Icon(Icons.refresh),
              ),
            ]
          ), flex: 3,),
          Flexible(child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pomodoros",
                        style: TextStyle(fontSize: 20, color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.w600),),
                      Text("$pomodoros", style: TextStyle(fontSize: 50, color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
            ],
          ), flex: 1,)
        ],
      ),
    );
  }
}
