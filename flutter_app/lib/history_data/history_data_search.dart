

import 'package:flutter_app/User.dart';
import 'package:flutter_app/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' ;
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'data_list_generator.dart';
import 'filters_screen.dart';
import 'history_app_theme.dart';
import 'history_data_view.dart';
import 'model/history_list_data.dart';

class HistoryDataScreen extends StatefulWidget {
  const  HistoryDataScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _HistoryDataScreenState createState() => _HistoryDataScreenState();
}

class _HistoryDataScreenState extends State<HistoryDataScreen>
    with TickerProviderStateMixin {
  final myController = TextEditingController();
//记录输入的值；

  var number;
  AnimationController animationController;
  List<HistoryDataList> historyDataList = HistoryDataList.historyList;
  final ScrollController _scrollController = ScrollController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {


    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    //AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字
    super.initState();
    postNet_2();
  }


  ///
  /// @description: //TODO
  /// @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  /// @date: 2021/2/26 11:27 AM
  /// No such property: code for class: Script1
  /// @return
  /// @version:
  ///

  void postNet_2() async {
    var params = Map<String, String>();
    params["user_id"] = "6376";
    var client = http.Client();

    var response = await client.post('http://10.6.2.61:8866/statistics/get_record', body: params);

    var _content = response.body;

    Map userMap = jsonDecode(_content.toString());
      //print(userMap);
    var _user= User.fromJson(userMap);
    _user.printMap(_user);

    //print(_content);
//TODO: Unhandled Exception: FormatException: Unexpected character (at character 1)

  }



  // void getNet_2() async {
  //   var client = http.Client();
  //   http.Response response = await client.get('http://10.6.2.61:8866/statistics/get_record');
  //   var _content0 = response.body;
  //   print(_content0.isEmpty);
  //   print(_content0);
  // }

  // void postNet_2() async {
  //   FormData formData = new FormData.fromMap({
  //     "user_id": "4936",
  //
  //   });
  //   var dio = new Dio();
  //   var response = await dio.post('http://10.6.2.61:8866/statistics/get_record', data: formData);
  //   var _content = response.data.toString();
  //
  //   print(_content.isEmpty);
  //   print(_content);
  // }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
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
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },//水波纹 回调
                child: Column(
                  children: <Widget>[
                    getAppBarUI(),//appbar
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
                                    getSearchBarUI(),//search bar
                                    getTimeDateUI(),
                                  ],
                                );
                              }, childCount: 1),
                            ),
                            SliverPersistentHeader(
                              pinned: true,
                              floating: true,
                              delegate: ContestTabHeader(
                                getFilterBarUI(),
                              ),
                            ),
                          ];
                        },
                        body: Container(
                          color:
                              HistoryTheme.buildLightTheme().backgroundColor,
                          child: ListView.builder(
                            itemCount: historyDataList.length,
                            padding: const EdgeInsets.only(top: 8),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =
                                  historyDataList.length > 10 ? 10 : historyDataList.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController.forward();
                              return HistoryDataListView(
                                callback: () {},
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

  Widget getListUI() {
    return Container(
      decoration: BoxDecoration(
        color: HistoryTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, -2),),
              //blurRadius: 8.0),
        ],//每一条信息
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 156 - 50,
            child: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return ListView.builder(
                    itemCount: historyDataList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final int count =
                          historyDataList.length > 10 ? 10 : historyDataList.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animationController,
                                  curve: Interval((1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                      animationController.forward();

                      return HistoryDataListView(
                        callback: () {},
                        historyData: historyDataList[index],
                        animation: animation,
                        animationController: animationController,
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getHistoryViewList() {
    final List<Widget> hotelListViews = <Widget>[];
    for (int i = 0; i < historyDataList.length; i++) {
      final int count = historyDataList.length;
      final Animation<double> animation =
          Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
      hotelListViews.add(
        HistoryDataListView(
          callback: () {},
          historyData: historyDataList[i],
          animation: animation,
          animationController: animationController,
        ),
      );
    }
    animationController.forward();
    return Column(
      children: hotelListViews,
    );
  }

  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose date',
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
              ],
            ),
          ),

        ],
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
                  color: HistoryTheme.buildLightTheme().backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
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
                      fontSize: 18,
                    ),
                    cursorColor: HistoryTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'date..',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: HistoryTheme.buildLightTheme().primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                icon: Icon(Icons.search,
                      size: 20,
                      color: HistoryTheme.buildLightTheme().backgroundColor),
                  onPressed: () {
                  setState(() {
                    print(myController.text);///TODO: search data.
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

  Widget getFilterBarUI() {

    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: HistoryTheme.buildLightTheme().backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: HistoryTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' $number data found',///TODO: count data number
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => FiltersScreen(),//TODO: filter the data by restriction
                            fullscreenDialog: true),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sort,
                                color: HistoryTheme.buildLightTheme()
                                    .primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }


  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HistoryTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
        child: Row(
          children: <Widget>[
            
            Expanded(
              child: Center(
                child: Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

          ],
        ),
    );
  }


class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }



}
