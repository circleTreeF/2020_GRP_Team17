

class HistoryDataList {
  HistoryDataList({
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HistoryDataList> historyList = <HistoryDataList>[
    HistoryDataList(
      titleTxt: '2021.1.1',
      subTxt: '90, A',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    HistoryDataList(

      titleTxt: '2021.1.2',
      subTxt: '80, B',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    HistoryDataList(
      titleTxt: '2021.1.3',
      subTxt: '70, C',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HistoryDataList(

      titleTxt: '60, D',
      subTxt: '2021.1.4',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HistoryDataList(

      titleTxt: '50, F',
      subTxt: '2021.1.5',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
