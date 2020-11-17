import './abstract_command.dart';
import './interface_command.dart';

class TextCommand extends Command implements ICommand {
  void fill(String key, String value) {
    this.setKey = key;
    this.setValue = value;
  }
}
