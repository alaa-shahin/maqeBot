import 'package:test/test.dart';

import '../../../src/bot/maqebot.dart';
import '../../../src/parser/text_parser.dart';
import '../../../src/util/global_constants.dart';

class TestMaqeBot {
  static const String className = 'TestMaqeBot';
  
  void testMove(String input) {
    GlobalConstants.testing = true;
    test('Move MaqeBot', () {
      String str    = input;
      MaqeBot bot   = MaqeBot();
      Map outputMap = bot.move(str);
      
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
  }
}
