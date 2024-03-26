import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dialogs{

  /// [showLoadingDialogWithFuture] 함수는 Flutter 앱에서 비동기 작업을 수행하는 동안
  /// 사용자에게 로딩 다이얼로그를 보여주고, 작업이 완료되면 결과와 다이얼로그가 제거되었는지 여부를 반환합니다.
  ///
  /// 이 함수는 제네릭 타입 [T]를 사용하여 다양한 종류의 비동기 작업 결과를 처리할 수 있습니다.
  /// 비동기 작업 [future]는 필수 매개변수로, 이 작업의 완료를 기다린 후 결과를 반환합니다.
  ///
  /// ## 매개변수:
  /// [BuildContext] [context] - 현재의 BuildContext, 이를 통해 대화 상자가 표시됩니다.
  /// [Future<T>] [future] - 결과를 기다리는 비동기 작업, 함수는 이 Future의 완료를 기다립니다.
  ///
  /// ## 반환값:
  /// Future<(T, bool)> - 작업의 결과 [T]와 대화 상자가 성공적으로 닫혔는지 여부를 나타내는 [bool]을 포함하는 튜플입니다.
  /// 대화 상자가 성공적으로 닫히면 [true], 그렇지 않으면 [false]를 반환합니다.
  static Future<(T, bool)> showLoadingDialogWithFuture<T>(BuildContext context , Future<T> future) async {

    late BuildContext dialogContext;

    showDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return const LoadingDialog();
      },
    );

    T result = await future;

    if(dialogContext.mounted){
      Navigator.pop(dialogContext);
      return (result , true);
    }
    else{
      return (result , false);
    }
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 50.w,
        height: 50.w,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: SizedBox(
              width: 50.w,
              height: 50.w,
              child: const CupertinoActivityIndicator()
          ),
        ),
      ),
    );
  }
}