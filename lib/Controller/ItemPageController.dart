import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Item.dart';
import 'package:app/Service/GameDataService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

class ItemPageController extends GetxController{

  Rx<Item?> combinationItem = Rx(null);
  late List<Item> componentItemList;
  late List<Item> completeItemList;
  late List<List<Item>> combinationItemList;
  LoadingState isLoaded = LoadingState.beforeLoading;

  RxList<Item?> items = RxList([null , null,null]);

  void onTapItem(Item item){
    if(isLoaded != LoadingState.success){
      return;
    }

    //#. 조합아이템인 경우
    if(item.type == ItemType.component){
      if(items[0] == null){
        items[0] = item;
      }
      else{
        items[1] = item;
      }

      if(items[0] != null &&  items[1] != null){
        items[2] = findCombinationItemInController(items[0]!  , items[1]!);
      }
    }
    //#. 완성아이템인 경우
    else{
      items[2] = item;
      if(item.composition.length == 2){
        items[0] = findItemByApiName(item.composition[0]);
        items[1] = findItemByApiName(item.composition[1]);
      }
      else{
        items[0] = null;
        items[1] = null;
      }
    }
  }

  void onTabTableItem(int index){
    if(index == 2){
      if(items[index] != null){
        items.assignAll([null, null, null]);
      }
    }
    else{
      if(items[index] != null){
        items[index] = null;
        items[2] = null;
      }
    }
  }


  Future<bool> fetchData()  async {
    try{
      if(isLoaded == LoadingState.beforeLoading || isLoaded == LoadingState.fail){

        var service = Get.find<GameDataService>();
        bool success = await service.fetchData();

        if(success){
          _setData(service.itemListByType);
          isLoaded = LoadingState.success;
          return true;
        }
        else{
          isLoaded = LoadingState.fail;
          StaticLogger.logger.i('데이터 가져오기 실패');
          return false;
        }
      }

      return true;
    }catch(e , s){
      StaticLogger.logger.e('$e , $s');
      return false;
    }

  }

  void _setData(Map<ItemType , List<Item>> itemListByType){
    componentItemList = itemListByType[ItemType.component]!;
    completeItemList = itemListByType[ItemType.completed]!;
    completeItemList.addAll(itemListByType[ItemType.emblem]!);
    combinationItemList = generateCombinationItemList(completeItemList);
  }

  List<List<Item>> generateCombinationItemList(List<Item> completeItemList){
    List<List<Item>> items = [];

    for(int y = 0; y < componentItemList.length; y++ ){
      items.add([]);
      for(int x = 0; x < componentItemList.length; x++ ){
        items[y].add(_findCombinationItemInList(completeItemList , componentItemList[x] , componentItemList[y]));
      }
    }

    return items;
  }

  Item _findCombinationItemInList(List<Item> completeItemList,Item a, Item b){
    try{
      return completeItemList.firstWhere((item) => item.isCombination(a,b));
    }catch(e){
      StaticLogger.logger.e(e);
      return Item.error();
    }
  }

  Item findCombinationItemByGridIndex(int index){
    try{
      return combinationItemList[index ~/ 10 - 1][index % 10 - 1];
    }catch(e){
      StaticLogger.logger.e(e);
      return Item.error();
    }
  }

  Item findCombinationItemInController(Item a, Item b){
    return _findCombinationItemInList(completeItemList , a , b);
  }

  Item? findItemByApiName(String apiName){
    Item? result = componentItemList.firstWhereOrNull((item) => item.apiName == apiName);
    if(result != null) return result;

    result = completeItemList.firstWhereOrNull((item) => item.apiName == apiName);
    return result;
  }
}