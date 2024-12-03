import 'package:buildify/app/enums/gradient.enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlignmentSelector extends GetView<AlignmentSelectorController> {
  AlignmentType? initialAlignment;
  Function(AlignmentType alignment) onChange;
  AlignmentSelector({super.key, this.initialAlignment, required this.onChange});

  @override
  get controller => Get.put(
      AlignmentSelectorController(
        alignment: Rx(initialAlignment ?? AlignmentType.center),
      ),
      tag: key.toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade500, width: 1),
      ),
      alignment: Alignment.center,
      child: Obx(() {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: [
              ...AlignmentType.values.map(
                (alignmentType) => SizedBox(
                  child: InkWell(
                    onTap: () {
                      controller.alignment.value = alignmentType;
                      onChange(controller.alignment.value);
                    },
                    child: Icon(
                      controller.alignment.value == alignmentType
                          ? MdiIcons.circle
                          : MdiIcons.circleOutline,
                      color: controller.alignment.value == alignmentType
                          ? Get.theme.primaryColor
                          : Colors.grey.shade500,
                      size: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class AlignmentSelectorController extends GetxController {
  Rx<AlignmentType> alignment = AlignmentType.center.obs;
  AlignmentSelectorController({required this.alignment});
}
