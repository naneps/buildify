import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImageProviderModel {
  String? pathImage;
  ImageProviderType? type;

  ImageProviderModel({this.pathImage, this.type});

  factory ImageProviderModel.fromJson(Map<String, dynamic> json) {
    return ImageProviderModel(
      pathImage: json['pathImage'],
      type: json['type'],
    );
  }

  ImageProvider toImageProvider() {
    switch (type) {
      case ImageProviderType.network:
        return NetworkImage(
          pathImage ?? '',
        );
      case ImageProviderType.asset:
        return AssetImage(pathImage ?? '');
      case ImageProviderType.memory:
        return MemoryImage(base64Decode(pathImage ?? ''));
      default:
        return NetworkImage(pathImage ?? '');
    }
  }

  toJson() => {'pathImage': pathImage, 'type': type!.name};
}

enum ImageProviderType { network, asset, memory }

extension ImageProviderTypeExtension on ImageProviderType {
  IconData get icon => {
        ImageProviderType.network: MdiIcons.web,
        ImageProviderType.asset: MdiIcons.image,
        ImageProviderType.memory: MdiIcons.memory,
      }[this]!;

  String get name => toString().split('.').last;
}
