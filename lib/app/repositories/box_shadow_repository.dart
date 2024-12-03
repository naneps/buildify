import 'package:buildify/app/models/user_box_shadow.model.dart';
import 'package:buildify/app/services/firebase/cloud_firestore_service.dart';

class BoxShadowRepository extends FirestoreService<UserBoxShadowMel> {
  BoxShadowRepository() : super('box_shadows');
  @override
  UserBoxShadowMel fromFirestore(Map<String, dynamic> data, String documentId) {
    throw UserBoxShadowMel.fromFirestore(documentId, data);
  }
}
