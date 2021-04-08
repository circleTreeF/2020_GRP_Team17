
///This class describes contents of the history record of one round driving.
class HistoryData {
  HistoryData({
    this.startTime = "",
    this.endTime = "",
    this.roundMark="",
    this.startDate = "",
    this.endDate = "",
  });

  ///The start time of this round of driving
  String startTime;
  ///The end time of this round of driving
  String endTime;
  ///The round mark of this round of driving
  String roundMark;
  ///The start date of this round of driving
  String startDate;
  ///The end date of this round of driving
  String endDate;


 ///The list of history data of this user.
  static List<HistoryData> historyList = <HistoryData>[];
}
