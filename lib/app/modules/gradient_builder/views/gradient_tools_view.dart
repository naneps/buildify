import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/overlays/scale_dialog.dart';
import 'package:buildify/app/commons/ui/preview_code_widget.dart';
import 'package:buildify/app/commons/ui/scroll_to_hide.widget.dart';
import 'package:buildify/app/modules/auth/views/form_signin.dart';
import 'package:buildify/app/modules/container_builder/views/container_editor_view.dart';
import 'package:buildify/app/modules/gradient_builder/controllers/gradient_builder_controller.dart';
import 'package:buildify/app/modules/gradient_builder/controllers/gradient_editor_controller.dart';
import 'package:buildify/app/modules/gradient_builder/controllers/gradient_tools_controller.dart';
import 'package:buildify/app/modules/gradient_builder/views/gradient_editor_view.dart';
import 'package:buildify/app/modules/gradient_builder/views/gradient_form_template_view.dart';
import 'package:buildify/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GradientToolsView extends GetView<GradientToolsController> {
  const GradientToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: controller.scaffoldMessengerKey,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            color: Get.theme.canvasColor,
            borderRadius: BorderRadius.circular(10),
            border: ThemeManager().defaultBorder(),
          ),
          child: Column(
            children: [
              TabBar(
                controller: controller.tabController,
                tabs: const [Tab(text: 'Gradient'), Tab(text: 'Shape')],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    GradientEditorView(
                      onChanged: (gradient) {
                        controller.onGradientChanged(gradient);
                      },
                    ),
                    ContainerEditorView(
                        key: const ValueKey("shape"),
                        container:
                            Get.find<GradientBuilderController>().container),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ScrollToHide(
                height: 45,
                controller:
                    Get.find<GradientEditorController>().scrollController,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: NeoButton(
                          onPressed: () {
                            if (Get.find<UserService>().uid.isEmpty) {
                              Get.dialog(const ScaleDialog(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  content: FormSignIn(),
                                ),
                              ));
                            } else {
                              showSaveDialog(controller.scaffoldKey);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MainColors.infoColor,
                            textStyle: Get.textTheme.labelMedium,
                          ),
                          child: const Text("Make Template"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: NeoButton.icon(
                          onPressed: () {
                            // controller.onGetCode();
                            showCode(controller.scaffoldKey);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MainColors.successColor,
                            textStyle: Get.textTheme.labelMedium,
                          ),
                          icon: Icon(MdiIcons.codeTags),
                          label: const Text("Get Code"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCode(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.showBottomSheet((context) {
      return PreviewCodeWidget(
        codeCss: "",
        codeFlutter: controller.code.call(),
      );
    });
  }

  showSaveDialog(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.showBottomSheet(
      (context) {
        return FormTemplateView(
          gradient: controller.userGradient,
          onSave: (userGradient) {
            controller.userGradient = userGradient;
            controller.makeGradient();
          },
        );
      },
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 0,
    );
  }
}
