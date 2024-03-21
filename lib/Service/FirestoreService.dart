import 'package:app/Model/Champion.dart';
import 'package:app/Model/Item.dart';
import 'package:app/Model/Trait.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

    static final CollectionReference championCollection = FirebaseFirestore.instance.collection('champions');
    static final CollectionReference traitsCollection = FirebaseFirestore.instance.collection('traits');
    static final CollectionReference itemCollection = FirebaseFirestore.instance.collection('items');

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

    static Future<List<Item>> getItemList(ItemType type)async{
      try{
        late QuerySnapshot snapshot;

        if(type == ItemType.component){
          snapshot = await itemCollection.doc('component').collection('data').get();
        }else if(type == ItemType.completed){
          snapshot = await itemCollection.doc('completed').collection('data').get();
        }else{
          snapshot = await itemCollection.doc('emblem').collection('data').get();
        }

        return snapshot.docs.map((e) => Item.fromMap(e.data() as Map<String , dynamic> , type)).toList();
      }catch(e , s){
        StaticLogger.logger.e("[FirestoreService.getItemList()] $e\n$s");
        rethrow;
      }
    }
}