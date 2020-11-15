import '../bot/AbstractBot.dart';
import '../command/CommandList';
import '../Mixins/Coordinates.dart';
import '../parser/TextParser.dart';
import './Constants';
import '../Util/GlobalConstants';
import 'dart:io';
import './Interface.MaqeBot';
import '../Logger/ConsoleLogger.dart';

class MaqeBot extends Bot with Coordinates implements IMaqeBot{

  TextParser p = TextParser();
  ConsoleLogger logger = ConsoleLogger();
  int x = 0;
  int y = 0;
  Map outputMap = new Map();
  Map tempMap = new Map();

  MaqeBot(){
    this.p = p;
    this.logger = logger; 
    this.outputMap = outputMap;
  }

   Map move(String input){
    CommandList cl = this.p.parse(input);
    this.logger.log('Now I\'am Moving');
    List commands = cl.getCommands; 
    for(int i = 0; i < commands.length; i++) {
      switch(commands[i].getKey){
        case Constants.TURN :
          switch(commands[i].getValue){
            case Constants.TURN_RIGHT :
              this.setDirection = this._turn(getDirection, Constants.TURN_RIGHT);
              break;
            
            case Constants.TURN_LEFT :
              this.setDirection = this._turn(getDirection, Constants.TURN_LEFT);
              break;  
          }
          break;
        case Constants.MOVE :
          int numOfSteps = int.parse(commands[i].getValue);
          switch (this.getDirection) {
            case Constants.NORTH :
              y += numOfSteps;
              break;

            case Constants.EAST :
              x += numOfSteps;
              break;

            case Constants.WEST :
              x -= numOfSteps;
              break;

            case Constants.SOUTH :
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
      case Constants.NORTH:
        switch(turn){
          case Constants.TURN_RIGHT :
            direction = Constants.EAST;
             break;

          case Constants.TURN_LEFT :
           direction = Constants.WEST;
            break;
        }
        break;

      case Constants.EAST :
        switch(turn){
          case Constants.TURN_RIGHT :
           direction = Constants.SOUTH;
            break;
          case Constants.TURN_LEFT :
            direction = Constants.NORTH;
            break;
        }
      break;

      case Constants.SOUTH :
        switch(turn){
          case Constants.TURN_RIGHT :
           direction = Constants.WEST;
            break;
          case Constants.TURN_LEFT :
           direction = Constants.EAST;
            break;
        }
      break;

      case Constants.WEST :
        switch(turn){
          case Constants.TURN_RIGHT:
           direction = Constants.NORTH;
            break;
          case Constants.TURN_LEFT :
           direction = Constants.SOUTH;
            break;
        }
      break;
    }
    return direction;
  }
}