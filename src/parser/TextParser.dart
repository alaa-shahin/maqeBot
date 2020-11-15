import'./AbstractParser.dart';
import '../command/TextCommand.dart';
import '../command/CommandList';
import '../Mixins/Coordinates.dart';
import './Constants';
import 'dart:io';
import '../Logger/ConsoleLogger.dart';

class TextParser extends Parser {
  CommandList commandList = CommandList();
  ConsoleLogger logger = ConsoleLogger();
  
  TextParser(){
    this.commandList = commandList;
    this.logger = logger;
  }
  CommandList parse(String input){
    this.logger.log('Parsing Input');
    List array = input.split('');
    for(int i = 0; i < array.length; i++){
      switch(array[i]){
        case Constants.TURN_RIGHT :
          TextCommand c = new TextCommand();
          c.fill(Constants.TURN,Constants.TURN_RIGHT);
          this.commandList.setCommand = c;
          break;

        case Constants.TURN_LEFT :
          TextCommand c = new TextCommand();
          c.fill(Constants.TURN,Constants.TURN_LEFT);
          this.commandList.setCommand = c;
          break;

        case Constants.WALK :
          String steps = '';
          for(int k = i+1; k < array.length; k++) {
            if(array[k] != Constants.TURN_RIGHT && array[k] != Constants.WALK && array[k] != Constants.TURN_LEFT){
              steps += array[k];
            } else {
              break;
            }
          }
          TextCommand c = new TextCommand();
          c.fill(Constants.MOVE, steps);
          this.commandList.setCommand = c;
          break;
      }
    }   
    CommandList c = this.commandList;
    this.commandList = new CommandList();
    return c;
  }
}