class Logger {
  static const _resetColor = '\x1B[0m';
  static const _blackColor = '\x1B[37m';
  static const _redColor = '\x1B[31m';
  static const _greenColor = '\x1B[32m';
  static log(String sentence, int state){
    if(state == -1){
      print('$_redColor$sentence$_resetColor');
    }
    else if(state == 1){
      print('$_greenColor$sentence$_resetColor');
    }
    else{
      print('$_blackColor$sentence$_resetColor');
    }
  }
}