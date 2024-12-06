import 'package:buildify/app/models/user_widget.model.dart';
import 'package:buildify/app/services/firebase/cloud_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WidgetRepository extends FirestoreService<UserWidgetModel> {
  WidgetRepository() : super('widgets');
  Future<void> createWidget(UserWidgetModel widget) async {
    try {
      await super.addItem(widget.toJson());
    } catch (e) {
      print("Error creating widget: $e");
      throw Exception('Failed to create widget: $e');
    }
  }

  Future<void> deleteWidget(String id) async {
    try {
      await super.deleteItem(id);
    } catch (e) {
      print("Error deleting widget: $e");
      throw Exception('Failed to delete widget: $e');
    }
  }

  @override
  UserWidgetModel fromFirestore(Map<String, dynamic> data, String documentId) {
    return UserWidgetModel.fromFirestore(data, documentId);
  }

  Future<List<UserWidgetModel>> getWidgets() async {
    try {
      return await getItems();
    } catch (e) {
      print("Error getting widgets: $e");
      throw Exception('Failed to get widgets: $e');
    }
  }

  Stream<List<UserWidgetModel>> streamWidgets() {
    try {
      Query query = collection.where('userId', isEqualTo: '');
      return streamItems(query: query);
    } catch (e) {
      print("Error streaming widgets: $e");
      throw Exception('Failed to stream widgets: $e');
    }
  }

  Future<void> updateWidget(String id, Map<String, dynamic> updates) async {
    try {
      await super.updateItem(id, updates);
    } catch (e) {
      print("Error updating widget: $e");
      throw Exception('Failed to update widget: $e');
    }
  }
}
