import 'package:buildify/app/commons/ui/overlays/scale_dialog.dart';
import 'package:buildify/app/models/filter/count_color.dart';
import 'package:buildify/app/models/filter/filter_gradient.dart';
import 'package:buildify/app/modules/auth/views/form_signin.dart';
import 'package:buildify/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '/app/models/user_gradient.model.dart';
import '/app/repositories/gradient.repository.dart';

class GradientPublicController extends GetxController
    with StateMixin<List<UserGradientModel>> {
  final gradientRepo = Get.find<GradientRepository>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scaffoldKeyPreview = GlobalKey<ScaffoldState>();
  final controllerImage = WidgetsToImageController();

  Rx<FilterGradientModel> filter = FilterGradientModel(
    colorCount: CountColor(count: null, operator: null),
    type: 'all',
  ).obs;

  RxString search = ''.obs;
  RxString filterType = 'all'.obs;
  RxList<UserGradientModel> gradients = RxList<UserGradientModel>([]);
  Rx<UserGradientModel> previewGradient = UserGradientModel().obs;
  Stream<List<UserGradientModel>> getGradients() {
    return gradientRepo.streamUserGradients();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    streamGradients();
    everAll(
      [search, filter],
      (callback) {
        streamGradients();
      },
    );
  }

  void showPreview(UserGradientModel gradient) {
    if (previewGradient.value.id == gradient.id) {
      previewGradient.value = UserGradientModel();
      return;
    }
    previewGradient.value = gradient;
  }

  void streamGradients() {
    gradientRepo
        .streamPublicGradients(search: search.value, filter: filter.value)
        .listen(
      (event) {
        if (event.isNotEmpty) {
          gradients.value = event;
          change(event, status: RxStatus.success());
        } else {
          change(event, status: RxStatus.empty());
        }
      },
    );
  }

  void toCreateGradient() {
    if (gradientRepo.userService.uid.isEmpty) {
      Get.dialog(const ScaleDialog(
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: FormSignIn(),
        ),
      ));
    } else {
      Get.toNamed(Routes.GRADIENT_BUILDER);
    }
  }
}
