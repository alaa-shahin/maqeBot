import '../bot/MaqeBot.dart';
import 'dart:io';
import '../validition/validition.dart';
import './Constants';
import '../Util/GlobalConstants';
import '../Logger/ConsoleLogger.dart';

class Application {
  Validation validator = Validation();
  ConsoleLogger logger = ConsoleLogger();
  static  Application _instance = null;
  
  Application._() {
    this.validator = validator;
    this.logger = logger;
  }

  static Application getInstance(){
    if(_instance == null){
      _instance = new Application._();
    }
    return _instance;
  }

  void runApp(){
    int chancesCount = 0;
    MaqeBot bot = MaqeBot();
    
    do {
      stdout.writeln('Enter Input:');
      String input = stdin.readLineSync();
      this.logger.log('App Is Running');
      if(false == this.validator.validate(input) ) {
        chancesCount++;
        if(chancesCount > 2) {
          print('You\'ve Exceeded number of allowed wrong inputs');
          exit(0);
        } else {
          print('Invalid Input... Please Try Again');
          continue;
        }
      }
      Map botLocation = bot.move(input);
      print("X: ${botLocation['X']} Y: ${botLocation['Y']} Direction: ${botLocation['Direction']}");
      stdout.writeln('Press Y to Continue, any key to Exit');
      String command = stdin.readLineSync();
      if(command != Constants.YES){
        print('Thank you! \nGood Bye... 👋  😃');
        exit(0);
      }
    } while(true);
  }
}