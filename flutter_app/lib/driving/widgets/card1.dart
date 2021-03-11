import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constant.dart';

class TitleCard extends StatelessWidget {
  final double width;


  final double height;
  final String text;

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
          style: TextStyle(
              color: Colors.blue,
              fontFamily: "Poppins-Bold",
              fontSize: 17,
              letterSpacing: 1.0
          ),
        )
    );
  }
}
