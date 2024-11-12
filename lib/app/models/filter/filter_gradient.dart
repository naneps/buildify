import 'package:buildify/app/models/filter/count_color.dart';

class FilterGradientModel {
  String? type;
  String? direction;
  String? sort;
  CountColor? colorCount;
  List<int>? colors; // Menggunakan List<int> untuk beberapa warna
  // Anda bisa menghapus 'color' jika tidak diperlukan

  FilterGradientModel({
    this.type,
    this.direction,
    this.sort,
    this.colorCount,
    this.colors,
  });
}
