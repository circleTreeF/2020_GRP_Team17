

import 'Record.dart';

class RecordList {

  ///The list of history record
  final List<Record> records;

  RecordList(this.records);

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 3:45 PM
  *** @version:1.0
  **/
  ///Convert Json to RecordList.
  factory RecordList.fromJson(List<dynamic> parsedJson) {
    // ignore: deprecated_member_use
    List<Record> record = new List<Record>();
    record = parsedJson.map((i) => Record.fromJson(i)).toList();
    return new RecordList(record);
  }
}
