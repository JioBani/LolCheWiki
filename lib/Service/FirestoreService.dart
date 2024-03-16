import 'package:app/Model/Champion.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

    static CollectionReference championCollection = FirebaseFirestore.instance.collection('champions');

    static Future<List<Champion>> getChampionList()async{
      try{
        QuerySnapshot snapshot = await championCollection.get();

        return snapshot.docs.map((e) => Champion.fromDocumentSnapshot(e)).toList();
      }catch(e , s){
        StaticLogger.logger.e("[FirestoreService.getChampionList()] $e\n$s");
        rethrow;
      }
    }
}