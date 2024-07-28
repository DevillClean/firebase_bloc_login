import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/data/model/localdb_model.dart';

class FireStoreDbProvider{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> writeToDb(DbModel model) async {
    try{
      await _firestore.collection('calculator').doc(model.id.toString()).set({
        "age": model.age,
        "height": model.height,
        "weight": model.weight,
        "totalBmi": model.totalBmi,
      });
    } catch (e){
      // ignore: avoid_print
      print('error writing to Firestore:$e');
    }
  }

  Future<List<DbModel>> readFromDb() async {
    try{
      QuerySnapshot snapshot = await _firestore.collection('calculator').get();
      List<DbModel> models = snapshot.docs.map((doc){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return DbModel(
          data['age'],
          data['height'],
          int.parse(doc.id), 
          data['weight'],
          data['totalBmi'],
          );
      }).toList(); 
      return models;
    } catch(e){
      // ignore: avoid_print
      print('Error deading from FireStore: $e');
      return List.empty();
    }
  }
}