import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Toasts{
  static void buildToast({
    required String text ,
    required BuildContext context ,
    Duration duration = const Duration(milliseconds: 300)
  }){
    showToast(
      text,
      context:context,
      animation: StyledToastAnimation.slideToBottom,
      animDuration: duration,
      curve: Curves.linearToEaseOut,
    );
  }
}


