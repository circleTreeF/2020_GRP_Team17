

class HistoryDataList {
  HistoryDataList({
    this.start_time = "",
    this.end_time = "",
    this.round_mark=0
  });


  String start_time;
  String end_time;
  double round_mark;


  static List<HistoryDataList> historyList = <HistoryDataList>[];
}
