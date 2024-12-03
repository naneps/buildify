import 'dart:convert';

import 'package:flutter/material.dart';

class ImageProviderModel {
  final String pathImage;
  final ImageProviderType imageProviderType;

  ImageProviderModel(
      {required this.pathImage, required this.imageProviderType});

  factory ImageProviderModel.fromJson(Map<String, dynamic> json) {
    return ImageProviderModel(
      pathImage: json['pathImage'],
      imageProviderType: json['imageProviderType'],
    );
  }

  ImageProvider toImageProvider() {
    switch (imageProviderType) {
      case ImageProviderType.network:
        return NetworkImage(pathImage);
      case ImageProviderType.asset:
        return AssetImage(pathImage);
      case ImageProviderType.memory:
        return MemoryImage(base64Decode(pathImage));
    }
  }

  toJson() => {'pathImage': pathImage, 'imageProviderType': imageProviderType};
}

enum ImageProviderType { network, asset, memory }
