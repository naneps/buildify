import 'package:buildify/app/commons/ui/overlays/scale_dialog.dart';
import 'package:buildify/app/modules/auth/views/form_signin.dart';
import 'package:buildify/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/models/user_gradient.model.dart';
import '/app/repositories/gradient.repository.dart';

class GradientPublicController extends GetxController
    with StateMixin<List<UserGradientModel>> {
  final gradientRepo = Get.find<GradientRepository>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scaffoldKeyPreview = GlobalKey<ScaffoldState>();
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
      [
        search,
        filterType,
      ],
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
    final filter =
        filterType.value == 'all' ? null.obs.value : filterType.value;
    gradientRepo.streamItems(filters: {
      'gradient_type': filter,
      'published': true,
    }, search: {
      'gradient_name': search.value.isEmpty ? null : search.value,
    }, orderBy: 'published_at', descending: true).listen(
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
