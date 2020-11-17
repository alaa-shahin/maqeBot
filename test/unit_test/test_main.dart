import 'dart:io';
import 'package:test/test.dart';

import '../../src/bot/maqebot.dart';
import '../../src/command/command_list.dart';
import '../../src/parser/text_parser.dart';
import '../../src/util/global_constants.dart';
import '../../src/validator/validator.dart';
import '../unit_test/maqebot/test_maqebot.dart';
import '../unit_test/parser/test_parser.dart';
import '../unit_test/validator/test_validate.dart';

class TestMain {
  void testMain() {
    GlobalConstants.testing = true;
    group('All Tests:', () {
      test('Move MaqeBot', () {
        MaqeBot bot = MaqeBot();
        Map outputMap = bot.move('W5');
        
        expect(outputMap is Map, true);
        expect(outputMap['X'] is int, true);
        expect(outputMap['Y'] is int, true);
        expect(outputMap['Direction'] is String, true);
        expect(outputMap.containsKey('X'), true);
        expect(outputMap.containsKey('Z'), false);
        expect(outputMap['X'], equals(0));
        expect(outputMap['Y'], equals(5));
        expect(outputMap['Direction'], equals('North'));
      });

      test('Parse Input', () {
        TextParser parser = TextParser();
        var output = parser.parse('RW15');

        expect(output is CommandList, true);
        expect(output is int, false);
        expect(output, equals(isInstanceOf<CommandList>()));
      });

      test('Validate Input', () {
        Validator validator = Validator();
        var output = validator.validate('RW10');

        expect(output, equals(true));
        expect(output, true);
        expect(output is bool, true);
        expect(output is String, false);
      });
      
    });
  }

  void tests() {
    stdout.writeln('write "all" For All Tests, "<nameOfTest>" to run specific Test:');
    String testName = stdin.readLineSync();
    switch(testName){
      case GlobalConstants.allTests :
        TestMain().testMain();
        break;

      case TestMaqeBot.className :
        TestMaqeBot().testMove('W5');
        break;

      case TestParser.className :
        TestParser().testParser('RW15');
        break;

      case TestValidate.className :
        TestValidate().testValidate('RW15RW1');
        break;

      default :
        print('Test Not Exist!'); exit(0);
        break;
    }
  }
}
