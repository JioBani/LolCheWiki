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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: (){
                fetchTestData();
              },
              child: Text(
                "데이터 가져오기"
              )
          )
        ],
      ),
    );
  }
}
