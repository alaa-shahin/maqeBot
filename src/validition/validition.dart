import 'dart:io';
import './Constants';
import '../validition/AbstractValidation';
import '../Logger/ConsoleLogger.dart';

class Validation extends Validations {
  
  ConsoleLogger logger = ConsoleLogger();

  Validation(){
    this.logger = logger; 
  }
  var numbers = Iterable<int>.generate(10).toList();
  List chars = [Constants.TURN_RIGHT, Constants.TURN_LEFT, Constants.WALK];

  bool validate(String input) {
    this.logger.log('Validate Input');
    List array = input.split('');
    for(int i = 0; i < array.length; i++) {
      if(chars.contains(array[i])){
        if(array[i] == Constants.WALK){
          try {
            if(false == numbers.contains(int.parse(array[i+1]))) {
              return false;
            }
          } catch(e) {
            return false;
          }
        } else {
          if(i < array.length-1) {
            if(false == chars.contains(array[i+1])) {
              return false;
            }
          }
        }
      } else {
        if(i == 0) {
          if(false == chars.contains(array[i])) {
            return false;
          }
        }
        try {
          if(false == numbers.contains(int.parse(array[i]))) {
            return false;
          }
        } catch(e) {
          return false;
        }
      }
    }
    return true;
  }
}