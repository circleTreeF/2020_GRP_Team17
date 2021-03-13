

class HistoryDataList {
  HistoryDataList({
    this.start_time = "",
    this.end_time = "",
    this.round_mark="",
    this.start_date = "",
    this.end_date = "",
  });


  String start_time;
  String end_time;
  String round_mark;
  String start_date;
  String end_date;



  static List<HistoryDataList> historyList = <HistoryDataList>[];
}
