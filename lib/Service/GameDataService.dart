import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Champion.dart';
import 'package:app/Model/Item.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/FirestoreService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

enum SortMode{
  name,
  cost,
  trait
}

class GameDataNotFetchedException implements Exception{
  @override
  String toString() => 'GameDataNotFetchedException: Game data not fetched';
}

class GameDataService extends GetxService{
  List<Champion>? championList;
  List<Champion>? championListSortByName;
  List<Champion>? championListSortByTrait;
  List<Champion>? championListSortByCost;

  Map<String , List<Champion>>? traitChampions;

  final Map<ItemType , List<Item>> itemListByType = {
    ItemType.component : [],
    ItemType.completed : [],
    ItemType.emblem : [],
  };

  List<Trait>? traitList;
  Map<TraitType ,List<Trait>> traitListByType = Map();
  Rx<LoadingState> loadingState = Rx(LoadingState.beforeLoading);

  Future<bool>? fetchTask;

  Future<bool> fetchData() async{
    try{
      if(loadingState.value == LoadingState.beforeLoading || loadingState.value == LoadingState.fail){
        fetchTask = _fetchData();
      }

      bool result = await fetchTask!;
      StaticLogger.logger.i(result);
      return result;

    }catch(e){
      StaticLogger.logger.e('[GameDataService.fetchData()] $e');
      return false;
    }
  }

  Future<bool> _fetchData() async {
    try{
      loadingState.value = LoadingState.loading;

      championList = (await FirestoreService.getChampionList()).where((element) => (1 <= element.cost && element.cost <= 5)).toList();
      championListSortByName = championList!.toList();
      championListSortByName!.sort(Champion.sortByName);

      championListSortByTrait = championList!.toList();
      championListSortByTrait!.sort(Champion.sortByTrait);

      championListSortByCost = championList!.toList();
      championListSortByCost!.sort(Champion.sortByCost);

      traitList = await FirestoreService.getTraitList();

      // 임의로 trait type 적용하기

      bool isClasses = true;

      for(var trait in traitList!){
        trait.setType(isClasses ? TraitType.classes : TraitType.origins);
        isClasses = !isClasses;
      }

      traitListByType[TraitType.origins] = traitList!.where((trait) => trait.type == TraitType.origins).toList();
      traitListByType[TraitType.classes] = traitList!.where((trait) => trait.type == TraitType.classes).toList();


      for(var champion in championListSortByTrait!){
        for(var trait in champion.traitNames){
          Trait targetTrait = traitList!.firstWhere((element) =>
            element.name == trait
          );
          targetTrait.addMember(champion);
          champion.addTrait(targetTrait);
        }
      }

      traitChampions = {};

      for (var trait in traitList!) {
        traitChampions![trait.name] = [];
      }

      for (var champion in championListSortByTrait!) {
        for (var trait in champion.traitNames) {
          if(traitChampions![trait] == null){
            traitChampions![trait] = [];

          }
          traitChampions![trait]!.add(champion);
        }
      }

      await fetchItemData();

      loadingState.value = LoadingState.success;
      StaticLogger.logger.i('[GameDataService._fetchData()] fatch success');
      return true;
    }catch(e , s){
      StaticLogger.logger.e('$e\n$s');
      loadingState.value = LoadingState.fail;
      StaticLogger.logger.e('[GameDataService._fetchData()] fatch fail');
      return false;
    }
  }

  Future<void> fetchItemData()async{
    try{
      await Future.wait(
          ItemType.values.map((e) async{
            itemListByType[e] = await FirestoreService.getItemList(e);
          })
      );

      return;
    }catch(e , s){
      StaticLogger.logger.e('GameDataService [fetchItemData()] $e\n$s');
      rethrow;
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
}