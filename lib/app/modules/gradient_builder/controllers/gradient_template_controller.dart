import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/commons/ui/overlays/x_snackbar.dart';
import '/app/models/user_gradient.model.dart';
import '/app/modules/gradient_builder/controllers/gradient_editor_controller.dart';
import '/app/modules/gradient_builder/controllers/gradient_tools_controller.dart';
import '/app/repositories/gradient.repository.dart';

class GradientTemplateController extends GetxController
    with StateMixin<List<UserGradientModel>> {
  final gradientRepo = Get.find<GradientRepository>();
  final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<UserGradientModel> gradients = RxList<UserGradientModel>([]);
  RxString filterType = 'all'.obs; // Changed to non-nullable RxString

  @override
  void onInit() {
    super.onInit();
    streamGradients();
    ever(filterType, (String? type) {});
  }

  void onPublishGradient(UserGradientModel gradient) async {
    gradient.published = true;
    await gradientRepo.updateGradient(gradient.id!, {
      'published': gradient.published,
      'published_at': DateTime.now().toIso8601String(),
    }).then((value) {
      scaffoldMessenger.currentState?.showSnackBar(XSnackBar.xSnackBar(
        scaffoldMessenger.currentState!.context,
        type: SnackBarType.success,
        message: 'Gradient published successfully',
      ));
    });
  }

  onRemoveGradient(UserGradientModel gradient) async {
    await gradientRepo.deleteGradient(gradient.id!).then((value) {
      scaffoldMessenger.currentState?.showSnackBar(
        XSnackBar.xSnackBar(
          scaffoldMessenger.currentState!.context,
          type: SnackBarType.success,
          message: 'Gradient removed successfully',
        ),
      );
    });
  }

  onUseGradient(UserGradientModel gradient) {
    Get.find<GradientEditorController>().gradient.value = gradient.gradient!;
    Get.find<GradientToolsController>().onGradientChanged(gradient.gradient!);
  }

  void resetFilter() {
    filterType.value = 'all';
    streamGradients();
  }

  streamGradients() {
    // Set filter to null if 'all', otherwise pass filterType value
    try {
      final filter =
          filterType.value == 'all' ? null.obs.value : filterType.value;
      gradientRepo.streamUserGradients(
        filters: {
          'gradient_type': filter,
        },
        onError: (e) {
          change([], status: RxStatus.error(e));
        },
      ).listen(
        (event) {
          if (event.isNotEmpty) {
            gradients.value = event;
            change(event, status: RxStatus.success());
          } else {
            change(event, status: RxStatus.empty());
          }
        },
      );
    } catch (e) {
      throw Exception('Failed to stream gradients: $e');
    }
  }
}
