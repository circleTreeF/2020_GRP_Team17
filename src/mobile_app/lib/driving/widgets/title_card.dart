import 'package:flutter/material.dart';
import 'package:road_monitoring_system/driving/util/constant_style.dart';

class TitleCard extends StatelessWidget {

  ///The width of this card
  final double width;
  ///The height of this card
  final double height;
  ///The text on this card
  final String text;
  ///The Constructor
  const TitleCard({Key key, this.width, this.height, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        width: width,
        height: height,

        padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
        //margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        decoration: BoxDecoration(

          color: Colors.transparent,

          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0.0, 4.0),
            ),
          ],

        ),

        child:

        Text(text,
          textAlign: TextAlign.center,
          style: CardTitleStyle,
    ),
    );
  }
}
