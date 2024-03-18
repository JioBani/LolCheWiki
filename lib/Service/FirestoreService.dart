import 'package:app/Model/Champion.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

    static CollectionReference championCollection = FirebaseFirestore.instance.collection('champions');
    static CollectionReference traitsCollection = FirebaseFirestore.instance.collection('traits');

    static Future<List<Champion>> getChampionList()async{
      try{
        QuerySnapshot snapshot = await championCollection.get();

        return snapshot.docs.map((e) => Champion.fromDocumentSnapshot(e)).toList();
      }catch(e , s){
        StaticLogger.logger.e("[FirestoreService.getChampionList()] $e\n$s");
        rethrow;
      }
    }

    static Future<List<Trait>> getTraitList()async{
      try{
        QuerySnapshot snapshot = await traitsCollection.get();

        return snapshot.docs.map((e) => Trait.fromMap(e.data() as Map<String , dynamic>)).toList();
      }catch(e , s){
        StaticLogger.logger.e("[FirestoreService.getChampionList()] $e\n$s");
        rethrow;
      }
    }
}