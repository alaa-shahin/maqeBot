import 'package:test/test.dart';

import '../../../src/command/command_list.dart';
import '../../../src/parser/text_parser.dart';
import '../../../src/util/global_constants.dart';

class TestParser {
  static const String className = 'TestParser';

  void testParser(String input) {
    GlobalConstants.testing = true;
    test('Parse Input', () {
      String str        = input;
      TextParser parser = TextParser();
      var output        = parser.parse(str);

      expect(output is CommandList, true);
      expect(output is int, false);
      expect(output, equals(isInstanceOf<CommandList>()));
    });
  }
}
