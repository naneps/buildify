// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/commons/ui/overlays/x_snackbar.dart';
import '/app/models/builder_models/gradient.model.dart';
import '/app/models/user_gradient.model.dart';
import '/app/modules/gradient_builder/controllers/gradient_builder_controller.dart';
import '/app/modules/gradient_builder/controllers/gradient_editor_controller.dart';
import '/app/repositories/gradient.repository.dart';

class GradientToolsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxString code = ''.obs;
  final gradientRepo = Get.find<GradientRepository>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final gradientRepo2 = Get.find<GradientRepository>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserGradientModel userGradient = UserGradientModel(
    gradient: null,
    name: "New Gradient",
  );
  void makeGradient() async {
    try {
      await gradientRepo2.createGradient(userGradient);
      scaffoldMessengerKey.currentState?.showSnackBar(
        XSnackBar.xSnackBar(
          scaffoldMessengerKey.currentState!.context,
          type: SnackBarType.success,
          message: "Gradient created successfully",
        ),
      );
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        XSnackBar.xSnackBar(
          scaffoldMessengerKey.currentState!.context,
          type: SnackBarType.error,
          message: "Failed to create gradient",
        ),
      );
    }
  }

  void onGradientChanged(GradientModel gradient) {
    Get.find<GradientBuilderController>().onGradientChanged(gradient);
    userGradient.gradient = gradient;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    ever(Get.find<GradientEditorController>().gradient, (newGradient) {
      code.value = newGradient.toCode();
    });
  }
}
