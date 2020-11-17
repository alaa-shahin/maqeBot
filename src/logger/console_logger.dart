import 'dart:io';

import './abstract_logger.dart';
import '../util/global_constants.dart';

class ConsoleLogger {
  int counter = 0;

  void log(String str) {
    if(true == GlobalConstants.testing) {
      return;
    } else {
      if(0 == counter) {
        print('$str...');
        sleep(new Duration(milliseconds: GlobalConstants.sleepTime));
        counter++;
      }
    }
  }
}
