import 'package:clone_linkin/models/notification.dart';
import 'package:flutter/cupertino.dart';

import '../Data/dummy_data.dart';

class NotiCounter extends ChangeNotifier {
  int temp = 0;
  Iterable<int> numOfNoti = notification.map((element) {
    int temp = 0;
    if (element.seen == true) {
      temp++;
    }
    return temp;
  });


  Iterable<int> get Num => numOfNoti;
}
