import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService<T> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath;

  FirestoreService(this.collectionPath);
  get collection => _firestore.collection(collectionPath);
  get instance => _firestore;
  Future<void> addItem(Map<String, dynamic> data) async {
    final docRef = _firestore.collection(collectionPath).doc();
    await docRef.set(data);
  }

  // Delete a document by ID
  Future<void> deleteItem(String id) async {
    final docRef = _firestore.collection(collectionPath).doc(id);
    await docRef.delete();
  }

  T fromFirestore(Map<String, dynamic> data, String documentId);
// Fetch a document by ID
  Future<Map<String, dynamic>?> getItemById(String id) async {
    final docRef = _firestore.collection(collectionPath).doc(id);
    final snapshot = await docRef.get();

    return snapshot.exists ? snapshot.data() : null;
  }

  Future<List<T>> getItems() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs
          .map((doc) => fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print("Error getting data: $e");
      throw Exception('Failed to get data: $e');
    }
  }

  // Stream documents with optional filters and ordering
  Stream<List<T>> streamItems({
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    String? orderBy,
    bool descending = false,
    required Query query,
  }) {
    try {
      Query queryDefault = _firestore.collection(collectionPath);
      queryDefault = query;
      return queryDefault.snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) =>
                      fromFirestore(doc.data() as Map<String, dynamic>, doc.id),
                )
                .toList(),
          );
    } catch (e) {
      print("Error streaming data: $e");
      throw Exception('Failed to stream data: $e');
    }
  }

  // Update an existing document
  Future<void> updateItem(String id, Map<String, dynamic> data) async {
    final docRef = _firestore.collection(collectionPath).doc(id);
    await docRef.update(data);
  }
}
