import 'package:app/Service/StaticLogger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadableListView extends StatefulWidget {

  const LoadableListView({
    super.key,
    required this.controller,
    required this.noMoreDataFooter,
    required this.failFooter,
    required this.loadingFooter,
    required this.loadButton,
    required this.itemList,
  });

  final LoadableListViewController controller;
  final Widget noMoreDataFooter;
  final Widget failFooter;
  final Widget loadingFooter;
  final Widget loadButton;
  final List<Widget> itemList;

  @override
  State<LoadableListView> createState() => LoadableListViewState();
}

class LoadableListViewState extends State<LoadableListView> {
  LoadableListViewResult result = LoadableListViewResult.init;

  @override
  void initState() {
    widget.controller._bindState(this);
    super.initState();
  }

  void startLoading(){
    setState(() {
      result = LoadableListViewResult.loading;
    });
  }

  void endLoading(LoadableListViewResult result){
    setState(() {
      this.result = result;
    });
  }

  void endInit(){
    setState(() {
      result = LoadableListViewResult.idle;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (c, i){
          if(i == widget.itemList.length){
            return Builder(
                builder: (context){
                  if(result == LoadableListViewResult.init){
                    return widget.loadingFooter;
                  }
                  else if(result == LoadableListViewResult.loading){
                    return widget.loadingFooter;
                  }
                  else if(
                  result == LoadableListViewResult.none ||
                      result == LoadableListViewResult.success ||
                      result == LoadableListViewResult.idle
                  ){
                    return widget.loadButton;
                  }
                  else if(result == LoadableListViewResult.noMoreData){
                    return widget.noMoreDataFooter;
                  }else if(result == LoadableListViewResult.fail){
                    return widget.failFooter;
                  }else{
                    return const CupertinoActivityIndicator();
                  }
                }
            );
          }
          else{
            return widget.itemList[i];
          }
        },
        itemCount: widget.itemList.length + 1,
      ),
    );
  }
}

class LoadableListViewController{
  late LoadableListViewState listViewState;

  Future<LoadableListViewResult> Function(LoadableListViewController) onLoading;
  Future<LoadableListViewResult> Function(LoadableListViewController)? onInit;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  LoadableListViewController({required this.onLoading , this.onInit});

  void _bindState(LoadableListViewState state){
    listViewState = state;
    if(onInit != null){
      init();
    }
    else{
      listViewState.endInit();
    }
  }

  Future<void> load() async {
    _isLoading = true;
    listViewState.startLoading();
    listViewState.endLoading(await onLoading(this));
    _isLoading = false;
  }

  Future<void> init() async {
    if(onInit!= null){
      _isLoading = true;
      listViewState.startLoading();
      listViewState.endLoading(await onInit!(this));
      _isLoading = false;
    }
    else{
      StaticLogger.logger.e("[LoadableListViewController.init()] onInit is null");
    }
  }
}

enum LoadableListViewResult{
  none,
  init,
  idle,
  loading,
  success,
  fail,
  noMoreData
}