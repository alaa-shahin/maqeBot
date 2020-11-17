import 'package:test/test.dart';

import '../../../src/parser/text_parser.dart';
import '../../../src/util/global_constants.dart';
import '../../../src/validator/validator.dart';

class TestValidate {
  static const String className = 'TestValidate';

  void testValidate(String input) {
    GlobalConstants.testing = true;
    test('Validate Input', () {
      String str = input;
      Validator validator = Validator();
      var output = validator.validate(str);

      expect(output, equals(true));
      expect(output, true);
      expect(output is bool, true);
      expect(output is String, false);
    });
  }
}
