import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/models/builder_models/box_shadow.model.dart';
import 'package:buildify/app/modules/box_shadow_builder/controllers/box_shadow_builder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxShadowToolsController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late TabController mainTabController;
  RxInt tabIndex = 0.obs;
  RxList<BoxShadowModel> boxShadows = RxList<BoxShadowModel>([
    BoxShadowModel(
      color: MainColors.darkColor,
      blurRadius: 0,
      spreadRadius: 1,
      offset: const Offset(2, 3),
      blurStyle: BlurStyle.solid,
    ),
  ]);

  void addShadow() {
    boxShadows.add(BoxShadowModel(
      color: MainColors.darkColor,
      blurRadius: 0,
      spreadRadius: 1,
      offset: const Offset(2, 3),
      blurStyle: BlurStyle.solid,
    ));
    refreshTabController();
    updateBoxShadowsInController();
  }

  @override
  void onInit() {
    super.onInit();
    mainTabController = TabController(length: 2, vsync: this);
    tabController = TabController(length: boxShadows.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform state changes here after the widget tree has built
      updateBoxShadowsInController();
    });
  }

  @override
  void onReady() {
    super.onReady();
    updateBoxShadowsInController();
    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });
  }

  void onShadowChanged(BoxShadowModel value, int index) {
    boxShadows[index] = value;
    boxShadows.refresh();
    updateBoxShadowsInController(index: index);
  }

  void refreshTabController() {
    tabController
        .dispose(); // Dispose the old TabController before creating a new one
    tabController = TabController(length: boxShadows.length, vsync: this);
    if (tabController.length > 0) {
      tabController.animateTo(tabController.length - 1);
    }
  }

  void removeShadow(int index) {
    boxShadows.removeAt(index);
    refreshTabController();
    updateBoxShadowsInController();
  }

  void updateBoxShadowsInController({int? index}) {
    final boxShadowCtrl = Get.find<BoxShadowBuilderController>();
    if (index != null) {
      boxShadowCtrl.containerModel.value.decoration?.value.boxShadow![index] =
          boxShadows[index];
    } else {
      boxShadowCtrl.containerModel.value.decoration?.value.boxShadow
        ?..clear()
        ..addAll(boxShadows);
    }
    boxShadowCtrl.containerModel.refresh();
  }
}
