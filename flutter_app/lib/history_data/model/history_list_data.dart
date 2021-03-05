

class HistoryDataList {
  HistoryDataList({
    this.start_time = "",
    this.end_time = "",
    this.round_mark=""
  });


  String start_time;
  String end_time;
  String round_mark;


  static List<HistoryDataList> historyList = <HistoryDataList>[];
}
