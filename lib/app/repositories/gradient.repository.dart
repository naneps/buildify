import 'package:buildify/app/enums/comparation_operator.dart';
import 'package:buildify/app/models/filter/filter_gradient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user_gradient.model.dart';
import '../services/firebase/cloud_firestore_service.dart';
import '../services/user_service.dart';

class GradientRepository extends FirestoreService<UserGradientModel> {
  final userService = Get.find<UserService>();
  GradientRepository() : super('gradients');
  Future<void> createGradient(UserGradientModel gradient) async {
    try {
      final data = gradient.copyWith(userId: userService.uid);
      super.addItem(data.toJson());
    } catch (e) {
      throw Exception('Failed to create gradient: $e');
    }
  }

  Future<void> deleteGradient(String id) async {
    try {
      super.deleteItem(id);
    } catch (e) {
      throw Exception('Failed to delete gradient: $e');
    }
  }

  Query filterPublicGradients(FilterGradientModel filter, {String? search}) {
    Query query = collection.where('published', isEqualTo: true);
    if (search != null) {
      query = query.where('name', isGreaterThanOrEqualTo: search);
      query = query.where('name', isLessThanOrEqualTo: '$search\uf8ff');
    }
    if (filter.type != null) {
      query = query.where('gradient_type',
          isEqualTo: filter.type == 'all' ? null : filter.type);
    }
    if (filter.colorCount != null) {
      if (filter.colorCount!.count != null &&
          filter.colorCount!.operator != null) {
        switch (filter.colorCount!.operator) {
          case ComparisonOperator.equals:
            query =
                query.where('color_count', isEqualTo: filter.colorCount!.count);
            break;
          case ComparisonOperator.lessThan:
            query = query.where('color_count',
                isLessThan: filter.colorCount!.count);
            break;
          case ComparisonOperator.moreThan:
            query = query.where('color_count',
                isGreaterThan: filter.colorCount!.count);
            break;
          case ComparisonOperator.lessThanOrEqual:
            query = query.where('color_count',
                isLessThanOrEqualTo: filter.colorCount!.count);
            break;
          case ComparisonOperator.moreThanOrEqual:
            query = query.where('color_count',
                isGreaterThanOrEqualTo: filter.colorCount!.count);
            break;
          case ComparisonOperator.notEquals:
          default:
            query = query.where('color_count',
                isNotEqualTo: filter.colorCount!.count);
        }
      }
    }
    return query;
  }

  @override
  UserGradientModel fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return UserGradientModel.fromJson(documentId, data);
  }

  Future<void> onLikeGradient(String docId) async {
    try {
      final gradientRef = collection.doc(docId);

      // Run transaction using FirebaseFirestore instance
      await instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(gradientRef);
        if (!snapshot.exists) {
          throw Exception('Gradient not found');
        }
        Map<String, dynamic> likedBy = snapshot.data()?['likedBy'] ?? {};
        int likeCount = snapshot.data()?['likeCount'] ?? 0;

        if (likedBy.containsKey(userService.uid)) {
          likedBy.remove(userService.uid);
          likeCount = (likeCount - 1)
              .clamp(0, likeCount); // Ensure count doesn't go negative
        } else {
          likedBy[userService.uid] = true;
          likeCount += 1;
        }

        // Update the document with new likedBy and likeCount values
        transaction.update(gradientRef, {
          'likedBy': likedBy,
          'likeCount': likeCount,
        });
      });

      print('Gradient successfully liked/unliked');
    } catch (e) {
      throw Exception('Failed to like/unlike gradient: $e');
    }
  }

  saveGradient(String s) {}

  Stream<List<UserGradientModel>> streamPublicGradients(
      {FilterGradientModel? filter, String? search}) {
    try {
      return streamItems(query: filterPublicGradients(filter!, search: search));
    } catch (e) {
      throw Exception('Failed to stream gradients: $e');
    }
  }

  Stream<List<UserGradientModel>> streamUserGradients(
      {Map<String, dynamic>? filters = const {}, Function(String)? onError}) {
    try {
      return super.streamItems(
        query: collection.where('userId', isEqualTo: userService.uid),
      );
    } catch (e) {
      onError?.call(e.toString());
      throw Exception('Failed to stream gradients: $e');
    }
  }

  Future<void> updateGradient(String id, Map<String, dynamic> updates) async {
    try {
      super.updateItem(id, updates);
    } catch (e) {
      throw Exception('Failed to update gradient: $e');
    }
  }
}
