abstract class Command {
  String _key;
  String _value;

  String get getKey {
    return this._key;
  }
  
  set setKey(String val) {
    this._key = val;
  }
   
  String get getValue {
    return this._value;
  }
  
  set setValue(String val) {
    this._value = val;
  }
}
