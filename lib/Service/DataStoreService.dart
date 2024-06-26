import 'dart:io';
import 'package:app/Model/RiotApi/MatchDto.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class DataStoreService{

  static Logger logger = Logger();


  static Future<String> _getFilePath(String filePath)async{
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$filePath';
  }

  static Future<File> _getFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  static Future<bool> _isPathExist(String filePath)async{
    final path = await _getFilePath(filePath);
    return await Directory(path).exists();
  }

  static Future<bool> _isFileExist(String filePath)async{
    final path = await _getFilePath(filePath);
    return await File(path).exists();
  }

  static Future<bool> _save(String path , String content) async{

    try {
      final file = await _getFile(path);
      await file.writeAsString(content);
      logger.i("[DataStoreService._save()] 저장 완료");
      return true;
    } catch (e) {
      logger.e("[DataStoreService.save()] $e");
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

  static Future<bool> _delete(String path, {bool recursive = false}) async {
    try {
      final file = await _getFile(path);
      await file.delete(recursive : recursive);
      logger.i("[DataStoreService._delete()] 삭제 완료");
      return true;
    } catch (e) {
      logger.e("[DataStoreService._delete()] $e");
      return false;
    }
  }

  static Future<void> _makeDirectory(String path) async{
    try{
      await Directory(await _getFilePath(path)).create(recursive: true);
    }catch(e){
      StaticLogger.logger.e("[DataStoreService._makeDirectory()] 디렉토리 생성 실패 : $e");
      rethrow;
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
        logger.e("[DataStoreService.readMatchIdList()] json 파싱 오류");
        return null;
      }
    }
  }

  static Future<bool> ensureMatchDtoDirectory(String puuid) async{
    try{
      String matchDtoPath =  getMatchDtoPath(puuid);
      bool isExist = await _isPathExist(matchDtoPath);

      if(!isExist){
        logger.i("[DataStoreService.ensureMatchDtoDirectory()] 존재하지않음 : $matchDtoPath");
        await _makeDirectory(matchDtoPath);
        logger.i("[DataStoreService.readMatchDto()] 디렉토리생성 : $matchDtoPath");
      }

      return true;
    }catch(e){
      StaticLogger.logger.e("[DataStoreService.ensureMatchDtoDirectory()] $e");
      return false;
    }

  }

  static Future<bool> saveMatchDto(String puuid, MatchDto matchDto) async{
    String matchDtoPath = getMatchDtoPath(puuid);
    final jsonString = jsonEncode(matchDto.toMap());
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
        return MatchDto.fromMap(decode, matchId);
      } catch (e) {
        logger.e("[DataStoreService.readMatchDto()] json 파싱 오류 : ${e}");
        return null;
      }
    }
  }

  static Future<bool> resetMatchData(String puuid)async{
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

  static Future<bool> saveBookmarkPuuid(String puuid) async {
    bool result = await _save('puuid.dat', puuid);
    if(result){
      StaticLogger.logger.i('[DataStoreService.saveBookmarkPuuid()] 즐겨찾기 puuid 저장 성공');
    }
    else{
      StaticLogger.logger.e('[DataStoreService.saveBookmarkPuuid()] 즐겨찾기 puuid 저장 실패');
    }
    return result;
  }

  static Future<String?> getBookmarkPuuid() async {
    String? result = await _read('puuid.dat');
    if(result == null){
      StaticLogger.logger.e('[DataStoreService.getProfileData()] 프로필 데이터 불러오기 실패');
      return null;
    }
    else{
      return result;
    }
  }

  static Future<bool> isBookmarkPuuidExist() async {
    return await _isFileExist('puuid.dat');
  }

  static Future<bool> removeBookmark(){
    return _delete('puuid.dat');
  }

  static Future<List<String>?> getSearchHistory() async {
    String? result = await _read('search.dat');
    if(result == null){
      StaticLogger.logger.e('[DataStoreService.getSearchHistory()] 검색 기록 불러오기 실패');
      return null;
    }
    else{
      try{
        return List<String>.from(jsonDecode(result));
      }catch(e , s){
        StaticLogger.logger.e('[DataStoreService.getSearchHistory()] 검색 기록 변환 실패');
        StaticLogger.logger.e('$e\n$s');
        return null;
      }
    }
  }

  static Future<bool> saveSearchHistory(List<String> searchHistory) async {
    bool result = await _save('search.dat', jsonEncode(searchHistory));
    if(result){
      StaticLogger.logger.i('[DataStoreService.saveSearchHistory()] 검색 기록 불러오기저장 성공');
    }
    else{
      StaticLogger.logger.e('[DataStoreService.saveSearchHistory()] 검색 기록 불러오기 저장 실패');
    }
    return result;
  }

  static Future<bool> removeSearchHistory(int index) async {
    List<String>? history = await getSearchHistory();

    if(history == null){
      return false;
    }
    else{
      if(history.length < index){
        history.removeAt(index);
      }
      return saveSearchHistory(history);
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