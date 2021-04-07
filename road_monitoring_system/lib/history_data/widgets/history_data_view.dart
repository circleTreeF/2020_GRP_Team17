import 'package:flutter/material.dart';
import 'package:road_monitoring_system/history_data/utils/history_app_theme.dart';

import '../model/history_list_data.dart';


/// A ListView widget to display the history records.
class HistoryDataListView extends StatelessWidget {
  const HistoryDataListView({Key key,
    this.historyData,
    this.animationController,
    this.animation,
  })
      : super(key: key);


  ///The [HistoryData] of one round driving of this user.
  final HistoryData historyData;
  ///The controller of the animation.
  final AnimationController animationController;
  ///The animation used in this widget
  final Animation<dynamic> animation;


  /// build method for UI rendering
 @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[

                            Container(
                              color: HistoryTheme
                                  .buildInterfaceTheme()
                                  .backgroundColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 8),
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              historyData.startDate+" "+historyData.startTime+"---"+" "+historyData.endDate+" "+historyData.endTime,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),

                                            Text(
                                              "round_mark: "+historyData.roundMark, // display the mark
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],

                                        ),



                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

