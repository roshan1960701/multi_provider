import 'package:flutter/widgets.dart';

class listData with ChangeNotifier {
  String greetings = 'Good Morning';

  void doGreet(String value) {
    greetings = value;
    notifyListeners();
  }
}

class Dgreet {
  listData _listData;
  Dgreet(this._listData);
  void doAnotherGreet() {
    _listData.doGreet('Good Knight');
  }
}
