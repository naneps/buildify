import 'package:buildify/app/models/builder_models/border_model.dart';
import 'package:buildify/app/models/builder_models/box_decoration_model.dart';
import 'package:buildify/app/models/builder_models/container_model.dart';
import 'package:buildify/app/models/circle_avatar_models/circle_avatar.model.dart';
import 'package:buildify/app/models/flex_models/column.model.dart';
import 'package:buildify/app/models/geometry_models/edge_inset_model.dart';
import 'package:buildify/app/models/listile_models/listile.model.dart';
import 'package:buildify/app/models/text_models/font_weight.model.dart';
import 'package:buildify/app/models/text_models/text.model.dart';
import 'package:buildify/app/models/text_models/text_style.model.dart';
import 'package:buildify/app/models/widget_models/main_widget.model.dart';
import 'package:buildify/app/models/widget_models/widget.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetBuilderController extends GetxController
    with GetSingleTickerProviderStateMixin {
//   final repo = Get.find<WidgetRepositor
  RxDouble xAxis = 0.0.obs;
  RxDouble yAxis = 0.0.obs;
  Rx<WidgetModel>? activeWidget = Rx<WidgetModel>(MainWidgetModel());
  Rx<WidgetModel> widget = ContainerModel(
          width: RxDouble(400.0),
          height: RxDouble(200.0),
          decoration: BoxDecorationModel(
            border: BorderModel(
              type: BorderType.all,
              all: BorderSideModel(
                width: 1,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ).obs,
          padding: EdgeInsetModel(
            all: 10,
            type: EdgeInsetType.all,
          ).obs,
          child: ColumnModel(
            children: [
              TextModel(
                text: 'Hello World'.obs,
                textAlign: TextAlign.center.obs,
                style: TextStyleModel(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: XFontWeight.w800,
                ).obs,
              ),
              ListTileModel(
                  leading: CircleAvatarModel(
                radius: 30,
                backgroundColor: Colors.black,
                child: TextModel(
                  text: 'A'.obs,
                  style: TextStyleModel(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: XFontWeight.w800,
                  ).obs,
                ),
              ))
            ],
          ).obs)
      .obs;

  late AnimationController animationController;
  late Animation<Offset> editorAnimation;

  // Menyembunyikan editor
  void hideEditor() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi AnimationController
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Inisialisasi Slide Animation
    editorAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Mulai dari luar layar
      end: Offset.zero, // Masuk ke layar
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    // Listener untuk mengatur ulang controller jika selesai
    ever(
      activeWidget!,
      (callback) {
        if (animationController.status == AnimationStatus.completed) {
          animationController.reset();
          animationController.forward();
        }
      },
    );
  }

  // Menampilkan editor
  void showEditor() {
    if (animationController.status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  // Update posisi sumbu X
  void updateXAxis(double x) {
    xAxis.value = x;
  }

  // Update posisi sumbu Y
  void updateYAxis(double y) {
    yAxis.value = y;
  }
}
