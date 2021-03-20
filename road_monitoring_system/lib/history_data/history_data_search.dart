import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/database/user_list.dart';
import 'package:road_monitoring_system/login/model/user_account.dart';



import 'view/history_app_theme.dart';
import 'history_data_view.dart';
import 'model/history_list_data.dart';

class HistoryDataScreen extends StatefulWidget {
  const  HistoryDataScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  HistoryDataScreenState createState() => HistoryDataScreenState();
}

class HistoryDataScreenState extends State<HistoryDataScreen>
    with TickerProviderStateMixin {



  final myController = TextEditingController();
  Dio dio =  Dio();
  Response response;
  var number;
  AnimationController animationController;
  List<HistoryDataList> historyDataList = HistoryDataList.historyList;
  final ScrollController _scrollController = ScrollController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  @override
  void initState() {


    getHistoryList();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }


  ///
  /// @description:
  /// @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  /// @date: 2021/2/26 11:27 AM
  /// No such property: code for class: Script1
  /// @return
  /// @version:
  ///
  //

 Future<void>  getHistoryList() async {
   response=await dio.get("http://10.6.2.61:8866/statistics/get/record",queryParameters:{"user_id":UserAccount().user_id,"date":"all"});

   var _content = response.data;

         UserList userList = UserList.fromJson(_content);
         print(userList.users);
         if (HistoryDataList.historyList.isNotEmpty) {
           HistoryDataList.historyList.clear();
         }

         for (int i = 0; i < userList.users.length; i++) {
           HistoryDataList _historyDataList = new HistoryDataList();
           _historyDataList.start_date = userList.users[i].start_time.substring(0,10);
           print(_historyDataList.start_date);
           _historyDataList.start_time=userList.users[i].start_time.substring(11,19);
           print(_historyDataList.start_time);
           _historyDataList.end_date = userList.users[i].end_time.substring(0,10);
           print(_historyDataList.end_date);
           _historyDataList.end_time = userList.users[i].end_time.substring(11,19);
           print(_historyDataList.end_time);
           _historyDataList.round_mark = userList.users[i].round_mark;
           print(_historyDataList.round_mark);

           setState(() {
             HistoryDataList.historyList.add(_historyDataList);
           });

         }
 }



  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HistoryTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              InkWell(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance()
                          .setHeight(50),
                    ),
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
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
                              .buildLightTheme()
                              .backgroundColor,
                          child: ListView.builder(
                            itemCount: historyDataList.length,
                            padding: const EdgeInsets.only(top: 10),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =  historyDataList.length;
                              final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: animationController,
                                      curve: Interval(
                                          (1 / count) * index, 1.0,
                                          curve: Curves.easeInOutSine)));
                              animationController.forward();

                              return HistoryDataListView(
                                historyData: historyDataList[index],
                                animation: animation,
                                animationController: animationController,
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  //search for the history data
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
                      .buildLightTheme()
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
                    //onChanged: (String txt) {},
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    cursorColor: HistoryTheme
                        .buildLightTheme()
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
                  .buildLightTheme()
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
                            .buildLightTheme()
                            .backgroundColor),
                    onPressed: () {
                      setState(() {
                        HistoryDataList.historyList.clear();
                        getHistoryListByDate(myController.text);

                        ///TODO: search data.
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

  //TODO: refresh the page.

    Future<void> getHistoryListByDate( String date) async {
    response=await dio.get("http://10.6.2.61:8866/statistics/get/record",queryParameters:{"user_id":UserAccount().user_id,"date":date});

    var _content = response.data;

    UserList userList = UserList.fromJson(_content);

    if (HistoryDataList.historyList.isNotEmpty) {
      HistoryDataList.historyList.clear();
    }

    for (int i = 0; i < userList.users.length; i++) {
      HistoryDataList _historyDataList = new HistoryDataList();
      _historyDataList.start_date = userList.users[i].start_time.substring(0,10);
      print(_historyDataList.start_date);
      _historyDataList.start_time=userList.users[i].start_time.substring(12,19);
      print(_historyDataList.start_time);
      _historyDataList.end_date = userList.users[i].end_time.substring(0,10);
      print(_historyDataList.end_date);
      _historyDataList.end_time = userList.users[i].end_time.substring(12,19);
      print(_historyDataList.end_time);
      _historyDataList.round_mark = userList.users[i].round_mark;
      print(_historyDataList.round_mark);
      setState(() {
        HistoryDataList.historyList.add(_historyDataList);

      });

    }
  }





  }
