import 'dart:ui';

import 'package:buildify/app/commons/theme_manager.dart';
import 'package:buildify/app/commons/typewriter_markdown.dart';
import 'package:buildify/app/commons/ui/buttons/neo_button.dart';
import 'package:buildify/app/commons/ui/buttons/neo_icon_button.dart';
import 'package:buildify/app/commons/ui/custom_appbar.dart';
import 'package:buildify/app/commons/ui/loading.widget.dart';
import 'package:buildify/app/commons/ui/responsive_layout.dart';
import 'package:buildify/app/modules/gradient_builder/controllers/gradient_public_controller.dart';
import 'package:buildify/app/modules/gradient_builder/views/gradient_preview_view.dart';
import 'package:buildify/app/modules/gradient_builder/views/grid_gradient_public_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GradientPublicView extends GetView<GradientPublicController> {
  const GradientPublicView({super.key});

  @override
  get controller => Get.put(GradientPublicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("UNDER CONSTRUCTION"),
            ],
          ),
          tablet: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                const CustomAppBar(),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Scaffold(
                          body: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              border: ThemeManager().defaultBorder(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: CustomScrollView(
                              slivers: [
                                const SliverAppBar(
                                  backgroundColor: Colors.transparent,
                                  leading: SizedBox.shrink(),
                                  expandedHeight: 100,
                                  flexibleSpace: FlexibleSpaceBar(
                                    collapseMode: CollapseMode.parallax,
                                    background: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Explore Stunning Gradients",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Search for gradients to inspire your next design project. Use the search bar to find specific styles.",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SliverAppBar(
                                  backgroundColor: Colors.transparent,
                                  pinned:
                                      true, // Keeps the AppBar visible when scrolling
                                  leading: const SizedBox.shrink(),
                                  expandedHeight: 40,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(15),
                                                  hintText: "Search Gradient",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            NeoIconButton(
                                              size: const Size(40, 40),
                                              icon:
                                                  Icon(MdiIcons.filterVariant),
                                              onPressed: () {},
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              height: 40,
                                              child: NeoButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      ThemeManager().infoColor,
                                                ),
                                                onPressed: () {
                                                  controller.toCreateGradient();
                                                },
                                                child: const Text(
                                                  "Create your own",
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: controller.obx(
                                      (snapshot) {
                                        return const GridGradientPublicView();
                                      },
                                      onEmpty: const Center(
                                        child: Text("No gradients found"),
                                      ),
                                      onLoading: const Center(
                                        child: LoadingWidget(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Scaffold(
                          key: controller.scaffoldKeyPreview,
                          body: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: ThemeManager().defaultBorder(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: CustomScrollView(
                              slivers: [
                                const SliverToBoxAdapter(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gradient Details",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Explore actions for the selected gradient: copy code, save as image, and more!",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                                SliverAppBar(
                                  leading: const SizedBox.shrink(),
                                  expandedHeight: 40,
                                  pinned: true,
                                  backgroundColor:
                                      ThemeManager().scaffoldBackgroundColor,
                                  flexibleSpace: ClipRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5,
                                        sigmaY: 5,
                                      ),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 40,
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeManager().successColor,
                                              ),
                                              onPressed: () {
                                                showCode(controller
                                                    .scaffoldKeyPreview);
                                              },
                                              icon: const Icon(Icons.code),
                                              label: const Text("Get Code"),
                                            ),
                                            const SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ThemeManager().infoColor,
                                              ),
                                              onPressed: () {
                                                // Implement save as image functionality
                                              },
                                              icon: const Icon(Icons.image),
                                              label:
                                                  const Text("Save as Image"),
                                            ),
                                            const SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                // Implement additional actions here
                                              },
                                              icon:
                                                  const Icon(Icons.more_horiz),
                                              label: const Text("More Actions"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Obx(() {
                                    if (controller.previewGradient.value.id !=
                                        null) {
                                      return GradientPreviewView(
                                        userGradient:
                                            controller.previewGradient.value,
                                      );
                                    } else {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: const Center(
                                          child: Text("No gradient selected"),
                                        ),
                                      );
                                    }
                                  }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCode(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.showBottomSheet(
      (context) {
        return Container(
          width: Get.width,
          padding: const EdgeInsets.all(16),
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: ThemeManager().defaultBorder(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: controller.previewGradient.value.id != null
                    ? TypewriterMarkdown(
                        controller.previewGradient.value.gradient!.toCode(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.codeTags),
                          const Text(
                            "Nothings code here",
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }
}
