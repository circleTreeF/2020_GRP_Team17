class FilterListData {
  FilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<FilterListData> popularFList = <FilterListData>[
    FilterListData(
      titleTxt: 'A',
      isSelected: false,
    ),
    FilterListData(
      titleTxt: 'B',
      isSelected: false,
    ),
    FilterListData(
      titleTxt: 'C',
      isSelected: true,
    ),
    FilterListData(
      titleTxt: 'D',
      isSelected: false,
    ),
    FilterListData(
      titleTxt: 'F',
      isSelected: false,
    ),
  ];


}
