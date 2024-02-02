import 'package:app/Common/LoadableListView/LoadableListView2.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScrollTest extends StatefulWidget {

  ScrollTest({super.key});

  @override
  State<ScrollTest> createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  List<String> items = ["0","1",];

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  late LoadableListViewController loadableListViewController = LoadableListViewController(onLoading: (controller)async{
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    setState(() {

    });
    StaticLogger.logger.i("[ScrollTest] 로딩 완료");
    return LoadableListViewResult.success;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}