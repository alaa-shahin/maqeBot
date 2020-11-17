import 'dart:io';

import 'src/application/application.dart';
import 'src/util/global_constants.dart';
import 'test/unit_test/maqebot/test_maqebot.dart';
import 'test/unit_test/parser/test_parser.dart';
import 'test/unit_test/test_main.dart';
import 'test/unit_test/validator/test_validate.dart';

class Director {
  void direct() {
    stdout.writeln('write "T" For Test, "R" For Run:');
    String input = stdin.readLineSync();
    switch(input) {
      case GlobalConstants.runApp :
        Application app = Application.getInstance();
        app.runApp();
        break;

      case GlobalConstants.testApp :
        TestMain().tests();
        break;
        
      default :
        print('Invalid Input!');
        print('Exiting...');
        exit(0);
        break;
    }
  }
}
