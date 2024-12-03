import 'package:buildify/app/models/builder_models/box_shadow.model.dart';

class UserBoxShadowMel {
  String? id;
  String? name;
  String? userId;
  List<BoxShadowModel>? shadows;
  String? createdAt;
  String? updatedAt;
  UserBoxShadowMel({
    this.id,
    this.name,
    this.userId,
    this.shadows,
    this.createdAt,
    this.updatedAt,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'shadows': shadows!.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserBoxShadowMel.fromFirestore(
          String documentId, Map<String, dynamic> json) =>
      UserBoxShadowMel(
        id: documentId,
        name: json['name'],
        userId: json['userId'],
        shadows: json['shadows'] != null
            ? List<BoxShadowModel>.from(
                json['shadows'].map((e) => BoxShadowModel.fromJson(e)))
            : null,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
