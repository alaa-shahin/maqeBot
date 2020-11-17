import 'dart:io';

import '../bot/abstract_bot.dart';
import '../command/command_list.dart';
import './constants.dart';
import './interface_maqebot.dart';
import '../logger/console_logger.dart';
import '../mixins/coordinates.dart';
import '../parser/text_parser.dart';
import '../util/global_constants.dart';

class MaqeBot extends Bot with Coordinates implements IMaqeBot {
  TextParser p          = TextParser();
  ConsoleLogger logger  = ConsoleLogger();
  int x = 0;
  int y = 0;
  Map outputMap = new Map();
  Map tempMap   = new Map();

  MaqeBot() {
    this.p          = p;
    this.logger     = logger; 
    this.outputMap  = outputMap;
  }

   Map move(String input) {
    CommandList commandList = this.p.parse(input);
    this.logger.log('Now I\'am Moving');
    List commands = commandList.getCommands; 
    for(int i = 0; i < commands.length; i++) {
      switch(commands[i].getKey) {
        case Constants.turn :
          switch(commands[i].getValue) {
            case Constants.turnRight :
              this.setDirection = this._turn(getDirection, Constants.turnRight);
              break;
            
            case Constants.turnLeft :
              this.setDirection = this._turn(getDirection, Constants.turnLeft);
              break;  
          }
          break;
        case Constants.move :
          int numOfSteps = int.parse(commands[i].getValue);
          switch (this.getDirection) {
            case Constants.north :
              y += numOfSteps;
              break;

            case Constants.east :
              x += numOfSteps;
              break;

            case Constants.west :
              x -= numOfSteps;
              break;

            case Constants.south :
              y -= numOfSteps;
              break;
          }
        break;
      }
    }
    this.setX = x;
    this.setY = y;
    this.outputMap['X'] = this.getX;
    this.outputMap['Y'] = this.getY;
    this.outputMap['Direction'] = this.getDirection;
    tempMap = this.outputMap;
    this.outputMap = new Map();
    return tempMap;
  }
  
  String _turn(String direction, String turn) {
    switch(direction){
      case Constants.north:
        switch(turn){
          case Constants.turnRight :
            direction = Constants.east;
             break;

          case Constants.turnLeft :
           direction = Constants.west;
            break;
        }
        break;

      case Constants.east :
        switch(turn){
          case Constants.turnRight :
           direction = Constants.south;
            break;
          case Constants.turnLeft :
            direction = Constants.north;
            break;
        }
      break;

      case Constants.south :
        switch(turn){
          case Constants.turnRight :
           direction = Constants.west;
            break;
          case Constants.turnLeft :
           direction = Constants.east;
            break;
        }
      break;

      case Constants.west :
        switch(turn){
          case Constants.turnRight:
           direction = Constants.north;
            break;
          case Constants.turnLeft :
           direction = Constants.south;
            break;
        }
      break;
    }
    return direction;
  }
}
