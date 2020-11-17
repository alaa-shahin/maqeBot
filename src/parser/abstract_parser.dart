import '../command/command_list.dart';

abstract class Parser {
  CommandList parse(String input);
}
