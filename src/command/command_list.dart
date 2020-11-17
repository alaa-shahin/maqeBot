import '../command/text_command.dart';

class CommandList {
  List _commands = [];

  set setCommand(TextCommand command) {
   return this._commands.add(command);
  }

  List get getCommands {
    return this._commands;
  }
}
