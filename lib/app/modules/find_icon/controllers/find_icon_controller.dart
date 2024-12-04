import 'package:get/get.dart';
import 'package:material_design_icons_flutter/icon_map.dart';

class FindIconController extends GetxController {
  List<String> fontPackages = ['material_design_icons_flutter'];
  List<String> sourceIcons = iconMap.keys.toList();
  RxList<String> filteredIcons = <String>[].obs;
  RxString search = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredIcons.addAll(sourceIcons); // Initially show all icons
    debounce(
      search,
      (callback) {
        if (search.isEmpty) {
          filteredIcons.assignAll(sourceIcons);
        } else {
          filteredIcons.assignAll(
            sourceIcons.where((icon) =>
                icon.toLowerCase().contains(search.value.toLowerCase())),
          );
        }
      },
      time: const Duration(milliseconds: 300), // Debounce delay
    );
  }
}
