import 'package:buildify/app/models/navigation_model.dart';
import 'package:buildify/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<NavigationModel> navigationItems = [
    NavigationModel(
        title: 'Gradient Builder',
        route: Routes.GRADIENT_PUBLIC,
        iconData: MdiIcons.gradientHorizontal),
    NavigationModel(
        title: 'Shadows Builder',
        route: Routes.CONTAINER_BUILDER,
        iconData: MdiIcons.boxShadow)
  ];
}
