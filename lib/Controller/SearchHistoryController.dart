import 'package:app/Service/DataStoreService.dart';
import 'package:get/get.dart';

class SearchHistoryController extends GetxController{

  RxList<String> searchHistory = RxList([]);

  Future<List<String>> getHistory() async {
    searchHistory.value = await DataStoreService.getSearchHistory() ?? [];
    return searchHistory;
  }

  void addHistory(String text){

    if(searchHistory.contains(text)){
      return;
    }

    searchHistory.add(text);

    if(searchHistory.length > 3){
      searchHistory.removeAt(0);
    }

    DataStoreService.saveSearchHistory(searchHistory);
  }

  void removeSearchHistory(int index){
    if(index < searchHistory.length){
      searchHistory.removeAt(index);
    }
    DataStoreService.removeSearchHistory(index);
  }
}