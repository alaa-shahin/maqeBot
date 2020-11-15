import './AbstractCommand.dart';
import './Interface.Command';
class TextCommand extends Command implements ICommand {

  void fill(String key, String value){
    this.setKey = key;
    this.setValue = value;
  }
}