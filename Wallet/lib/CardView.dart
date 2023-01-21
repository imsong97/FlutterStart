import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String money, property, unit;
  final Color backgroundColor, contentColor;

  const CardView({
    required this.money,
    required this.property,
    required this.unit,
    required this.backgroundColor,
    required this.contentColor
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(money, style: TextStyle(color: contentColor, fontSize: 32, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      property,
                      style: TextStyle(color: contentColor, fontSize: 20, ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      unit,
                      style: TextStyle(color: contentColor.withOpacity(0.8), fontSize: 20, ),
                    )
                  ],
                )
              ],
            ),
            Transform.scale(
                scale: 2,
                child: Transform.translate(
                    offset: Offset(5, 12),
                    child: Icon(getIcon(money), color: contentColor, size: 88,)
                )
            )
          ],
        ),
      ),
    );
  }

  IconData? getIcon(String money) {
    IconData? iconData;
    if (money == "Euro") {
      iconData = Icons.euro_rounded;
    } else if (money == "Dollar") {
      iconData = CupertinoIcons.money_dollar;
    } else if (money == "Bitcoin") {
      iconData = CupertinoIcons.bitcoin;
    } else {

    }
    return iconData;
  }
}