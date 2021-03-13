import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constant.dart';


class EmptyCard extends StatelessWidget {
  final double width;


  final double height;
  final String text;

  const EmptyCard({Key key, this.width, this.height, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: height,

        padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),

      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue, width: 1),//边框

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
          color: kPrimaryColor,
          fontFamily: "Poppins-Bold",
          fontSize: 18,
          letterSpacing: 1.0
      ),
      )
    );
  }
}
