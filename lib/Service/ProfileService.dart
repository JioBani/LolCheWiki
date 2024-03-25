import 'package:app/Controller/LoadingState.dart';
import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/DataStoreService.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:get/get.dart';

class ProfileService extends GetxService{
  String? puuid;
  Rx<SummonerProfile?> profile = Rx(null);
  Rx<LoadingState> loadingState = Rx(LoadingState.beforeLoading);

  Future<void> fetchData() async {
    loadingState.value = LoadingState.loading;
    if(await DataStoreService.isBookmarkPuuidExist()){
      puuid = await DataStoreService.getBookmarkPuuid();

      if(puuid == null){
        StaticLogger.logger.e('[ProfileController.fetchData()] 로컬에서 puuid를 불러 올 수 없음');
        loadingState.value = LoadingState.fail;
        return;
      }
      else{
        RiotApiResponse<SummonerProfile> response = await RiotApiService.getSummonerProfileByPuuid(puuid!);

        if(response.isSuccess){
          profile.value = response.response;
          if(profile.value == null){
            StaticLogger.logger.e('[ProfileController.fetchData()] 프로필 데이터를 riot api에서 가져 올 수 없음');
            StaticLogger.logger.e('[ProfileController.fetchData()] ${response.exception?.msg}\n${response.stackTrace}');
            loadingState.value = LoadingState.fail;
          }
          else{
            StaticLogger.logger.i(profile.value!.toMap());
            loadingState.value = LoadingState.success;
          }
          return;
        }
        else{
          StaticLogger.logger.e('[ProfileController.fetchData()] 프로필 데이터를 riot api에서 가져 올 수 없음');
          StaticLogger.logger.e('[ProfileController.fetchData()] ${response.exception?.msg}\n${response.stackTrace}');
          loadingState.value = LoadingState.fail;
          return;
        }
      }
    }
    else{
      StaticLogger.logger.e('[ProfileController.fetchData()] puuid가 없음');
      loadingState.value = LoadingState.success;
    }
  }

  Future<bool> removeProfile() async {
    bool result = await DataStoreService.removeBookmark();
    if(result){
      profile.value = null;
    }
    return result;
  }
}