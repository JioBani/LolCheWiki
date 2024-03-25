import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Toasts{
  static void buildToast({required String text , required BuildContext context}){
    showToast(
      text,
      context:context,
      animation: StyledToastAnimation.slideToBottom,
      animDuration: Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut,
    );
  }
}