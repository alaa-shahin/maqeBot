import 'dart:io';

import'./abstract_parser.dart';
import '../command/text_command.dart';
import '../command/command_list.dart';
import './constants.dart';
import '../logger/console_logger.dart';
import '../mixins/coordinates.dart';

class TextParser extends Parser {
  CommandList commandList = CommandList();
  ConsoleLogger logger = ConsoleLogger();
  
  TextParser() {
    this.commandList = commandList;
    this.logger = logger;
  }
  CommandList parse(String input) {
    this.logger.log('Parsing Input');
    List array = input.split('');
    for(int i = 0; i < array.length; i++) {
      switch(array[i]) {
        case Constants.turnRight :
          TextCommand c = new TextCommand();
          c.fill(Constants.turn,Constants.turnRight);
          this.commandList.setCommand = c;
          break;

        case Constants.turnLeft :
          TextCommand c = new TextCommand();
          c.fill(Constants.turn,Constants.turnLeft);
          this.commandList.setCommand = c;
          break;

        case Constants.walk :
          String steps = '';
          for(int k = i+1; k < array.length; k++) {
            if(array[k] != Constants.turnRight && array[k] != Constants.walk && array[k] != Constants.turnLeft) {
              steps += array[k];
            } else {
              break;
            }
          }
          TextCommand c = new TextCommand();
          c.fill(Constants.move, steps);
          this.commandList.setCommand = c;
          break;
      }
    }   
    CommandList c = this.commandList;
    this.commandList = new CommandList();
    return c;
  }
}
