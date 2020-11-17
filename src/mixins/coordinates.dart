abstract class Coordinates {
  int _x = 0;
  int _y = 0;
  String _direction = 'North';
  
  int get getX {
    return this._x;
  }
  
   set setX(int value) {
    this._x = value;
  }
   
  int get getY {
    return this._y;
  }
  
  set setY(int value) {
    this._y = value;
  }
  
  String get getDirection {
    return this._direction;
  }
  
  set setDirection(String value) {
    this._direction = value;
  }
}
