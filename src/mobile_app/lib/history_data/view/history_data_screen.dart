import 'dart:ui';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/database/model/record_list.dart';
import 'package:road_monitoring_system/history_data/utils/history_app_theme.dart';
import 'package:road_monitoring_system/login/model/user_account.dart';


import '../widgets/history_data_view.dart';
import '../model/history_list_data.dart';

///This class describes the screen displayed the history data.
class HistoryDataScreen extends StatefulWidget {
  const  HistoryDataScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  HistoryDataScreenState createState() => HistoryDataScreenState();
}


class HistoryDataScreenState extends State<HistoryDataScreen>
    with TickerProviderStateMixin {

  ///The controller for the editable text field for entering date.
  final myController = TextEditingController();
  ///Creates a dio instance
  Dio dio =  Dio();
  ///Http response information.
  Response response;
  ///The controller controls the animation.
  AnimationController animationController;
  ///The static list of history data of the [HistoryData].
  List<HistoryData> historyDataList = HistoryData.historyList;
  ///The controller controls the scrollable widget.
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    getHistoryList();// fetch the history data from the database and display them on this interface
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  /// build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HistoryTheme.buildInterfaceTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
               Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance()
                          .setHeight(50),
                    ),
                    Expanded(
                      child: NestedScrollView(
                        controller: scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(70),
                                      ),
                                      getSearchBarUI(), //search bar
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                    ],
                                  );
                                },childCount: 1),
                              ),

                          ];
                        },

                        body: Container(
                          color:
                          HistoryTheme
                              .buildInterfaceTheme()
                              .backgroundColor,
                          child: ListView.builder(
                            itemCount: historyDataList.length,
                            padding: const EdgeInsets.only(top: 10),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =  historyDataList.length; // the number of the history record in historyDataList
                              final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: animationController,
                                      curve: Interval(
                                          (1 / count) * index, 1.0,
                                          curve: Curves.easeInOutSine)));
                              //the listView of history record presents a easeInOutSine animation.
                              animationController.forward();

                              return HistoryDataListView(
                                historyData: historyDataList[index],
                                animation: animation,
                                animationController: animationController,
                              );
                            },
                          ),//build the ListView history record
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/15 8:34 PM
  *** @version:1.2
  **/

  ///Returns the widget of searching for the history data
  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HistoryTheme
                      .buildInterfaceTheme()
                      .backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    controller: myController,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    cursorColor: HistoryTheme
                        .buildInterfaceTheme()
                        .primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search by date : 2020-11-09 ',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: HistoryTheme
                  .buildInterfaceTheme()
                  .primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),

            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.search,
                        size: 15,
                        color: HistoryTheme
                            .buildInterfaceTheme()
                            .backgroundColor),
                    onPressed: () {
                      setState(() {
                        HistoryData.historyList.clear();//first clear the historyList in order to add another list of history records
                        getHistoryListByDate(myController.text);//get the record on certain date
                      });
                    },),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/21 8:06 PM
*** @version:2.0
**/


  /// Gets history data on the certain date from the database
  ///
  ///Use [Dio] to make HTTP [GET] request 
  Future<void> getHistoryListByDate( String date) async {
    response=await dio.get("http://10.6.2.61:8866/statistics/get/record",queryParameters:{"user_id":UserAccount().user_id,"date":date});

    var _content = response.data;

    RecordList recordList = RecordList.fromJson(_content);

    if (HistoryData.historyList.isNotEmpty) {
      HistoryData.historyList.clear();
    }


    //add all items to the _historyDataList
    for (int i = 0; i < recordList.records.length; i++) {

      HistoryData _historyDataList = new HistoryData();

      _historyDataList.startDate = recordList.records[i].startTime.substring(0,10);
      _historyDataList.startTime=recordList.records[i].startTime.substring(12,19);
      _historyDataList.endDate = recordList.records[i].endTime.substring(0,10);
      _historyDataList.endTime = recordList.records[i].endTime.substring(12,19);
      _historyDataList.roundMark = recordList.records[i].roundMark;


      setState(() {
        HistoryData.historyList.add(_historyDataList);
        //Notify the [HistoryDataListView] that the state of this object has changed.
        //after changing the historyList, the interface will display the new record list.
      });

    }
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/21 8:06 PM
*** @version:1.0
**/

  ///Gets history data from database and adds them to the list
  ///
  /// Use [Dio] to make http [GET] request
  ///
  Future<void>  getHistoryList() async {
    response=await dio.get("http://10.6.2.61:8866/statistics/get/record",queryParameters:{"user_id":UserAccount().user_id,"date":"all"});

    var _content = response.data;

    RecordList recordList = RecordList.fromJson(_content);
    print(recordList.records);
    if (HistoryData.historyList.isNotEmpty) {
      HistoryData.historyList.clear();
    }

    for (int i = 0; i < recordList.records.length; i++) {
      HistoryData _historyDataList = new HistoryData();
      _historyDataList.startDate = recordList.records[i].startTime.substring(0,10);
      print(_historyDataList.startDate);
      _historyDataList.startTime=recordList.records[i].startTime.substring(11,19);
      print(_historyDataList.startTime);
      _historyDataList.endDate = recordList.records[i].endTime.substring(0,10);
      print(_historyDataList.endDate);
      _historyDataList.endTime = recordList.records[i].endTime.substring(11,19);
      print(_historyDataList.endTime);
      _historyDataList.roundMark = recordList.records[i].roundMark;
      print(_historyDataList.roundMark);

      setState(() {
        HistoryData.historyList.add(_historyDataList);
        //Notify the [HistoryDataListView] that the state of this object has changed.
        //after changing the historyList, the interface will display the new record list.
      });

    }
  }



  }
