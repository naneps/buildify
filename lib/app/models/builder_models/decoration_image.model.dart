import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:buildify/app/models/image_provider_model/image_provider.model.dart';
import 'package:flutter/material.dart';

class DecorationImageModel {
  ImageProviderModel? image;
  BoxFit? fit;
  AlignmentType? alignmentType;
  ImageRepeat? repeat;
  bool invertColors;
  bool isAntiAlias;
  bool matchTextDirection;
  double scale;
  double opacity;
  FilterQuality filterQuality;

  DecorationImageModel({
    this.image,
    this.fit,
    this.alignmentType,
    this.repeat,
    this.invertColors = false,
    this.isAntiAlias = false,
    this.matchTextDirection = false,
    this.filterQuality = FilterQuality.high,
    this.scale = 1.0,
    this.opacity = 1.0,
  });

  factory DecorationImageModel.fromJson(Map<String, dynamic> json) =>
      DecorationImageModel(
        image: ImageProviderModel.fromJson(json['image']),
        fit: json['fit'] != null ? BoxFit.values[json['fit']] : null,
        alignmentType: json['alignment'] != null
            ? AlignmentType.values[json['alignment']]
            : null,
        repeat:
            json['repeat'] != null ? ImageRepeat.values[json['repeat']] : null,
        invertColors: json['invertColors'] ?? false,
        isAntiAlias: json['isAntiAlias'] ?? false,
        matchTextDirection: json['matchTextDirection'] ?? false,
        scale: json['scale'] ?? 1.0,
        opacity: json['opacity'] ?? 1.0,
        filterQuality: json['filterQuality'] != null
            ? FilterQuality.values[json['filterQuality']]
            : FilterQuality.high,
      );

  DecorationImage toDecorationImage() {
    return DecorationImage(
      image: image!.toImageProvider(),
      fit: fit,
      alignment: alignmentType?.alignment ?? Alignment.center,
      repeat: repeat ?? ImageRepeat.noRepeat,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      scale: scale,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image!.toJson(),
        'fit': fit?.name,
        'alignment': alignmentType?.name,
        'repeat': repeat?.name,
        'invertColors': invertColors,
        'isAntiAlias': isAntiAlias,
        'matchTextDirection': matchTextDirection,
        'scale': scale,
        'opacity': opacity,
        'filterQuality': filterQuality.name,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
