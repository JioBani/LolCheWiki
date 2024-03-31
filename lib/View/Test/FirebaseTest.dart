/*
import 'package:app/Model/Champion.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTestPage extends StatelessWidget {
  const FirebaseTestPage({super.key});

  Future<List<Map<String, dynamic>>> fetchTestData() async {
    List<Map<String, dynamic>> testData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('test').get();

      List<String> _result = querySnapshot.docs.map((e) => e['name'] as String).toList();

      StaticLogger.logger.i(_result);

      return testData;
    } catch (e) {
      print('Error fetching test data: $e');
      return testData;
    }
  }

  Future<void> uploadChampionToFirestore(Champion champion) async {
    try {
      // Get a reference to the champions collection
      CollectionReference champions = FirebaseFirestore.instance.collection('champions');

      // Convert Champion object to a Map

      // Upload the Champion document to the collection with the API name as document ID
      await champions.doc(champion.apiName).set(champion.toMap());
      print('Champion uploaded successfully!');
    } catch (e) {
      print('Error uploading champion: $e');
    }
  }

  Future<List<Champion>> getChampionsFromFirestore() async {
    try {
      // Get a reference to the champions collection
      CollectionReference champions = FirebaseFirestore.instance.collection('champions');

      // Get documents from the collection
      QuerySnapshot querySnapshot = await champions.get();

      // Convert documents to Champion objects
      List<Champion> championList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Champion.fromJson(data);
      }).toList();

      return championList;
    } catch (e,s) {
      StaticLogger.logger.e('Error getting champions from Firestore: $e : $s');
      return [];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                String jsonFilePath = 'assets/json/set10.json';
                List<Champion> champions = await createChampionsFromJsonFile(jsonFilePath);
                List<String> championNames = champions.map((champion) => champion.name).toList();
                StaticLogger.logger.i(championNames);

                for (Champion champion in champions) {
                  await uploadChampionToFirestore(champion);
                }
              },
              child: Text(
                "데이터 업로드"
              )
          ),
          TextButton(
              onPressed: () async {
                List<Champion> champions = await getChampionsFromFirestore();
                List<String> championNames = champions.map((champion) => champion.name).toList();
                StaticLogger.logger.i(championNames);
              },
              child: Text(
                  "데이터 다운로드"
              )
          )
        ],
      ),
    );
  }
}
*/
