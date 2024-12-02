import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/ui/avatar_widget.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/buttons/neo_icon_button.dart';
import 'package:buildify/app/commons/ui/buttons/theme_toggle_button.dart';
import 'package:buildify/app/commons/ui/logo.dart';
import 'package:buildify/app/commons/ui/overlays/scale_dialog.dart';
import 'package:buildify/app/modules/auth/views/form_signin.dart';
import 'package:buildify/app/services/firebase/firebase_auth_service.dart';
import 'package:buildify/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends GetView<CustomAppBarController> {
  const CustomAppBar({super.key});

  @override
  get controller => Get.put(CustomAppBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: ThemeManager().defaultBorder(),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Logo(),
          const Spacer(),
          const SizedBox(width: 10),
          Obx(() {
            return Row(
              children: [
                Visibility(
                  visible: controller.userService.user.value.uid != null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      border: ThemeManager().defaultBorder(),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).canvasColor,
                    ),
                    width: 200,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      leading: AvatarWidget(
                        user: controller.userService.user.value,
                        radius: 20,
                      ),
                      title: Text(
                        controller.userService.user.value.name ?? 'Anonymous',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      trailing: Icon(
                        MdiIcons.dotsVertical,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.userService.user.value.uid == null,
                  child: NeoButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Get.dialog(const ScaleDialog(
                        child: AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: FormSignIn(),
                        ),
                      ));
                    },
                    child: const Text('Sign In'),
                  ),
                ),
              ],
            );
          }),
          const ThemeToggleButton(),
          const SizedBox(width: 10),
          NeoIconButton(
            size: const Size(50, 50),
            onPressed: () {},
            icon: Icon(
              MdiIcons.github,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarController extends GetxController {
  final userService = Get.find<UserService>();
  final authService = Get.find<FirebaseAuthService>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
