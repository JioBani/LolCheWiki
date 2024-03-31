import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/FirestoreService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

class TraitInfoPageController extends GetxController{
  List<Trait>? traitList;
  Rx<LoadingState> loadingState = Rx(LoadingState.beforeLoading);

  Future<void> fetchTraitList() async {
    try{
      loadingState.value = LoadingState.loading;

      traitList = await FirestoreService.getTraitList();

      loadingState.value = LoadingState.success;
    }
    catch(e,s){
      StaticLogger.logger.e("$e\n$s");
      loadingState.value = LoadingState.fail;
    }
  }
}