/*
import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Champion.dart';
import 'package:app/Service/FirestoreService.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

class ChampionListPageController extends GetxController{
  List<Champion>? championList;
  List<Champion>? championListSortByName;
  List<Champion>? championListSortByTrait;
  List<Champion>? championListSortByCost;

  Rx<LoadingState> loadingState = Rx(LoadingState.beforeLoading);

  Future<void> getChampionData() async{
    loadingState.value = LoadingState.loading;

    try{
      championList = (await FirestoreService.getChampionList()).where((element) => (1 <= element.cost && element.cost <= 5)).toList();
      championListSortByName = championList!.toList();
      championListSortByName!.sort(Champion.sortByName);

      championListSortByTrait = championList!.toList();
      championListSortByTrait!.sort(Champion.sortByCost);

      championListSortByCost = championList!.toList();
      championListSortByCost!.sort(Champion.sortByTrait);

      loadingState.value = LoadingState.success;

    }catch(e , s){
      StaticLogger.logger.e('$e\n$s');

      loadingState.value = LoadingState.fail;
    }
  }

  List<Champion>? getChampionList(SortMode sortMode){
    if(sortMode == SortMode.cost){
      return championListSortByCost;
    }
    else if(sortMode == SortMode.name){
      return championListSortByName;
    }
    else{
      return championListSortByTrait;
    }
  }
}*/
