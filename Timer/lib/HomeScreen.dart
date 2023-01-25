import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(child: Container(
            alignment: Alignment.bottomCenter,
            child: Text("25:00",
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,)
            ),
          ), flex: 1,),
          Flexible(child: Center(
            child: IconButton(
              iconSize: 120,
              color: Theme.of(context).cardColor,
              onPressed: (){},
              icon: Icon(Icons.play_circle_outline),
            ),
          ), flex: 3,),
          Flexible(child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pomodoros",
                        style: TextStyle(fontSize: 20, color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.w600),),
                      Text("0", style: TextStyle(fontSize: 50, color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.w600))
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
