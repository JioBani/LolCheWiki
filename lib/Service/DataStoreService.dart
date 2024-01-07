import 'dart:io';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class DataStoreService{

  static Logger logger = Logger();


  static Future<String> _getFilePath(String filePath)async{
    final directory = await getApplicationDocumentsDirectory();
    // 파일 경로와 파일 이름을 합쳐서 전체 파일 경로를 만듬
    return '${directory.path}/$filePath';
  }

  // 파일 경로를 생성하는 함수
  static Future<File> _getFile(String fileName) async {
    // 앱의 디렉토리 경로를 가져옴
    final directory = await getApplicationDocumentsDirectory();
    // 파일 경로와 파일 이름을 합쳐서 전체 파일 경로를 만듬
    return File('${directory.path}/$fileName');
  }

  static Future<bool> _isPathExist(String filePath)async{
    final path = await _getFilePath(filePath);
    // 파일 경로와 파일 이름을 합쳐서 전체 파일 경로를 만듬
    return await Directory(path).exists();
  }

  static Future<bool> _save(String path , String content) async{

    try {
      final file = await _getFile(path);
      await file.writeAsString(content);
      logger.i("[DataStoreService._save()] 저장 완료");
      return true;
    } catch (e) {
      logger.e("[DataStoreService.save()] $e");
      // 파일을 읽을 수 없는 경우 빈 맵을 반환하거나 예외 처리를 수행할 수 있습니다.
      return false;
    }
  }

  static Future<String?> _read(String path) async {
    try {
      final file = await _getFile(path);
      final contents = await file.readAsString();
      logger.i("[DataStoreService.read()] 읽기 완료");
      return contents;
    } catch (e) {
      logger.e("[DataStoreService.read()] $e");
      return null;
    }
  }

  static String getMatchIdListPath(String puuid){
    return "$puuid/matchIdList.json";
  }

  static String getMatchDtoPath(String puuid){
    return "$puuid/matches";
  }

  static Future<bool> saveMatchIdList(String puuid, List<String> matchDataList) async{
    final jsonString = jsonEncode(matchDataList);
    return await _save(getMatchIdListPath(puuid), jsonString);
  }

  static Future<List<String>?> readMatchIdList(String puuid) async{
    String? content = await _read(getMatchIdListPath(puuid));
    if(content == null){
      logger.e("[DataStoreService.readMatchIdList()] 파일을 읽을 수 없음");
      return null;
    }
    else{
      try {
        final decodedList = jsonDecode(content);
        return List<String>.from(decodedList);
      } catch (e) {
        // 파일을 읽을 수 없는 경우 빈 리스트를 반환하거나 예외 처리를 수행할 수 있습니다.
        logger.e("[DataStoreService.readMatchIdList()] json 파싱 오류");
        return null;
      }
    }
  }

  static Future<bool> saveMatchDto(String puuid, MatchDto matchDto) async{
    String matchDtoPath = getMatchDtoPath(puuid);
    bool isExist = await _isPathExist(matchDtoPath);

    if(!isExist){
      String path = await _getFilePath(matchDtoPath);
      logger.i("[DataStoreService.readMatchDto()] $path");
      var directory = await Directory(path).create(recursive: true);
      logger.i("[DataStoreService.readMatchDto()] 디렉토리생성");
    }

    final jsonString = jsonEncode(matchDto);
    return await _save("$matchDtoPath/${matchDto.matchId}.json", jsonString);
  }

  static Future<MatchDto?> readMatchDto(String puuid , String matchId) async{
    String matchDtoPath = getMatchDtoPath(puuid);
    String? content = await _read("$matchDtoPath/$matchId.json");
    if(content == null){
      logger.e("[DataStoreService.readMatchDto()] 매치가 존재하지 않음");
      return null;
    }
    else{
      try {
        final decode = jsonDecode(content);
        return MatchDto.fromJson(decode, matchId);
      } catch (e) {
        // 파일을 읽을 수 없는 경우 빈 리스트를 반환하거나 예외 처리를 수행할 수 있습니다.
        logger.e("[DataStoreService.readMatchDto()] json 파싱 오류 : ${e}");
        return null;
      }
    }
  }

  static Future<bool> resetData(String puuid)async{
    String matchDtoPath = getMatchDtoPath(puuid);
    
    try{
      String matchPath = await _getFilePath(matchDtoPath);
      final dir = Directory(matchPath);
      dir.deleteSync(recursive: true);

      File matchIds = await _getFile(getMatchIdListPath(puuid));
      matchIds.delete();

      return true;

    }catch(e){
      logger.e("[DataStoreService.resetData()] $e");
      return false;
    }
  }

  static Future<bool> removeAllData() async{
    try{
      String matchPath = await _getFilePath("");
      final dir = Directory(matchPath);
      dir.deleteSync(recursive: true);
      logger.i("[DataStoreService.removeAllData()] 데이터 전부 삭제 완료");
      return true;

    }catch(e){
      logger.e("[DataStoreService.removeAllData()] $e");
      return false;
    }
  }


}