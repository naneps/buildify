import 'package:buildify/app/models/navigation_model.dart';
import 'package:buildify/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeController extends GetxController {
  RxString search = ''.obs;

  RxList<NavigationModel> navigationItems = <NavigationModel>[].obs;

  final sourceNavigationItems = [
    NavigationModel(
      title: 'Gradient Builder',
      route: Routes.GRADIENT_PUBLIC,
      iconData: MdiIcons.gradientHorizontal,
    ),
    NavigationModel(
      title: 'Shadows Builder',
      route: Routes.BOX_SHADOW_BUILDER,
      iconData: MdiIcons.boxShadow,
    ),
    NavigationModel(
      title: 'Widget builder',
      route: Routes.WIDGET_BUILDER,
      iconData: MdiIcons.widgets,
    ),
    NavigationModel(
      title: 'Container Builder',
      route: Routes.CONTAINER_BUILDER,
      iconData: MdiIcons.trainCarContainer,
    ),
  ];
  @override
  void onInit() {
    super.onInit();
    navigationItems.value = sourceNavigationItems;
    debounce(
      search,
      (callback) {
        print("callback: $callback");
        if (callback.isEmpty) {
          navigationItems.value = [...sourceNavigationItems];
        }
        navigationItems.value = navigationItems.where((element) {
          return element.title.toString().toLowerCase().contains(
                callback.toLowerCase(),
                element.title!.length,
              );
        }).toList();
      },
      time: const Duration(milliseconds: 500),
    );
  }
}
