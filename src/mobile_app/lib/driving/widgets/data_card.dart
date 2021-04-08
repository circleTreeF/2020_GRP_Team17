import 'package:flutter/material.dart';
import 'package:road_monitoring_system/driving/util/constant_style.dart';

///This class represents the card which is used to display the data collected during the driving process.
class DataCard extends StatelessWidget {
  ///The width of this card
  final double width;
  ///The height of this card
  final double height;
  ///The text on this card
  final String text;

  ///The Constructor
  const DataCard({Key key, this.width, this.height, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
      
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue, width: 1),
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
                style: CardDataStyle,)
    );
  }
}
