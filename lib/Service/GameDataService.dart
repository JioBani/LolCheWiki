import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Champion.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/FirestoreService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

enum SortMode{
  name,
  cost,
  trait
}

class GameDataService extends GetxService{
  List<Champion>? championList;
  List<Champion>? championListSortByName;
  List<Champion>? championListSortByTrait;
  List<Champion>? championListSortByCost;
  Map<String , List<Champion>>? traitChampions;

  List<Trait>? traitList;
  Map<TraitType ,List<Trait>> traitListByType = Map();
  Rx<LoadingState> loadingState = Rx(LoadingState.beforeLoading);


  Future<void> fetchData() async {
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
}