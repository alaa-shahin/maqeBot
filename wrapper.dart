import 'director.dart';
import 'src/util/global_constants.dart';

class Wrapper {
  void wrap() {
    GlobalConstants.testing = true;
    try {
      Director().direct();

    } catch(e) {
      print('The data you are input trying to view cannot be shown because the authenticity of the received data could not be verified. \nPlease contact the website owners to inform them of this problem.');
    }
  }
}
