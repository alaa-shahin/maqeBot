import '../Util/GlobalConstants';
import 'dart:io';
import './AbstractLogger';
class ConsoleLogger {
  int counter = 0;

  void log(String str){
    if(GlobalConstants.TESTING == true){
      return;
    } else {
      if(counter == 0){
        print('$str...');
        sleep(new Duration(milliseconds: GlobalConstants.SLEEP_TIME));
        counter++;
      }
    }
  }
}