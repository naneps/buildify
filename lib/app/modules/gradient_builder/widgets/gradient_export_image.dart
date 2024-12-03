import 'dart:io' show File;
import 'dart:io';
import 'dart:typed_data';

import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/modules/gradient_builder/controllers/gradient_public_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;
import 'package:widgets_to_image/widgets_to_image.dart';

class GradientExportImage extends GetView<GradientPublicController> {
  const GradientExportImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: Get.height,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: ThemeManager().defaultBorder(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    "Export as Image",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Spacer(),
                  InkWell(
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: Obx(() {
                  if (controller.previewGradient.value.gradient == null) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No gradient selected"),
                      ],
                    );
                  }
                  return DefaultTabController(
                    length: 6,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          indicatorWeight: 3,
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            const Tab(
                                icon: Icon(Icons.crop_square), text: "Square"),
                            const Tab(icon: Icon(Icons.circle), text: "Circle"),
                            const Tab(
                                icon: Icon(Icons.crop_16_9), text: "Rectangle"),
                            const Tab(
                                icon: Icon(Icons.crop_din),
                                text: "Rounded Rectangle"),
                            const Tab(
                                icon: Icon(Icons.diamond), text: "Diamond"),
                            Tab(
                                icon: Icon(MdiIcons.shapeOvalPlus),
                                text: "Oval"),
                          ],
                        ),
                        Expanded(
                          child: Obx(() {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBarView(
                                children: [
                                  // Square shape (Desktop wallpaper size)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WidgetsToImage(
                                        controller: controller.controllerImage,
                                        child: Container(
                                          height: Get.width * 0.2,
                                          width: Get.width * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: controller
                                                .previewGradient.value.gradient!
                                                .toGradient()
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Circle shape (Centered on wallpaper)
                                  Center(
                                    child: WidgetsToImage(
                                      controller: controller.controllerImage,
                                      child: Container(
                                        height: 512,
                                        width: 512,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: controller
                                              .previewGradient.value.gradient!
                                              .toGradient()
                                              .value,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Rectangle shape (Mobile wallpaper size)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WidgetsToImage(
                                        controller: controller.controllerImage,
                                        child: Container(
                                          height: Get.width * 0.2,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            gradient: controller
                                                .previewGradient.value.gradient!
                                                .toGradient()
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Rounded Rectangle (Tablet wallpaper size)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WidgetsToImage(
                                        controller: controller.controllerImage,
                                        child: Container(
                                          height: Get.width * 0.2,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            gradient: controller
                                                .previewGradient.value.gradient!
                                                .toGradient()
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Diamond shape (Custom rotated square)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WidgetsToImage(
                                        controller: controller.controllerImage,
                                        child: Transform.rotate(
                                          angle:
                                              0.785398, // 45 degrees in radians
                                          child: Container(
                                            height: Get.width * 0.15,
                                            width: Get.width * 0.15,
                                            decoration: BoxDecoration(
                                              border: ThemeManager()
                                                  .defaultBorder(),
                                              gradient: controller
                                                  .previewGradient
                                                  .value
                                                  .gradient!
                                                  .toGradient()
                                                  .value,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Oval shape (Desktop or Tablet wallpaper)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WidgetsToImage(
                                        controller: controller.controllerImage,
                                        child: Container(
                                          height: Get.width * 0.15,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                              left: Radius.circular(1000),
                                              right: Radius.circular(1000),
                                            ),
                                            gradient: controller
                                                .previewGradient.value.gradient!
                                                .toGradient()
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              NeoButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: MainColors.darkColor,
                ),
                onPressed: () {
                  capture();
                },
                child: const Text("Export"),
              )
            ],
          ),
        );
      }),
    );
  }

  void capture() async {
    try {
      final Uint8List? image = await controller.controllerImage.capture();
      final fileName =
          '${controller.previewGradient.value.name!.split(' ').join('-')}.png';
      if (image != null) {
        if (kIsWeb) {
          final blob = html.Blob([image]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          html.AnchorElement(href: url)
            ..setAttribute(
              "download",
              fileName,
            )
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          final directory = await getApplicationDocumentsDirectory();
          final path = '${directory.path}/$fileName';
          final file = File(path);
          await file.writeAsBytes(image);
          await Share.shareXFiles([XFile(path)]);
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
